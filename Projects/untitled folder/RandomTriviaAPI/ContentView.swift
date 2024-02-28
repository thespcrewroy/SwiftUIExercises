import SwiftUI
import Foundation
import Combine

struct ContentView: View {
    @ObservedObject var trivia = GetData()
    @State private var score: Int = 0 // Score state variable
    
    var body: some View {
        NavigationView {
            List(trivia.questions) { question in
                NavigationLink(destination: QuestionDetailView(question: question, score: $score)) { // Pass score as binding
                    Text("Question: \(question.question.text)")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .listRowBackground(Color.purple)
                .cornerRadius(10)
            }
            .navigationBarTitle("Trivia Questions")
        }
        .background(Color.purple)
    }
}

class GetData: ObservableObject {
    
    @Published var questions = [Trivial]()
    
    init() {
        load()
    }
    
    func load() {
        guard let dataUrl = URL(string: "https://the-trivia-api.com/v2/questions/") else {
            print("Invalid URL")
            return
        }
        
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: dataUrl) { data, _, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No Data")
                return
            }
            
            do {
                let decodedLists = try decoder.decode([Trivial].self, from: data)
                DispatchQueue.main.async {
                    self.questions = decodedLists
                }
            } catch {
                print("Decoding Error: \(error)")
            }
        }.resume()
    }
}

struct Trivial: Codable, Identifiable {
    let id: String
    let category: String
    let correct: String
    let incorrect: [String]
    let question: Question
    let tags: [String]
    let type: String
    let difficulty: String
    let regions: [String]
    let isNiche: Bool
    
    enum CodingKeys: String, CodingKey {
        case category
        case id
        case correct = "correctAnswer"
        case incorrect = "incorrectAnswers"
        case question
        case tags
        case type
        case difficulty
        case regions
        case isNiche
    }
}

struct Question: Codable {
    let text: String
}

struct QuestionDetailView: View {
    
    var question: Trivial
    @Binding var score: Int // Binding for score
    @State private var selectedAnswer: String?
    @State private var isCorrect: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Question: \(question.question.text)")
                .font(.headline)
                .padding()
            
            ForEach(question.incorrect + [question.correct], id: \.self) { option in
                Button(action: {
                    selectedAnswer = option
                    isCorrect = option == question.correct
                    if isCorrect {
                        score += 1
                    }
                }) {
                    Text(option)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedAnswer == option ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 4)
            }
            
            if selectedAnswer != nil {
                Text(isCorrect ? "Correct!" : "Incorrect. The correct answer is: \(question.correct)")
                    .padding()
                    .foregroundColor(isCorrect ? .green : .red)
            }
            
            Spacer()
            
            Text("Your Score: \(score)")
                .padding()
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
        .navigationBarTitle("Answer")
    }
}


#Preview {
    ContentView()
}
