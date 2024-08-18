import SwiftUI
import Foundation
import Combine

struct ContentView: View {
    
    @ObservedObject var studentInfo = GetData()
    
    var body: some View {
        List(studentInfo.students) { student in
            VStack(alignment: .leading) {
                Text(student.lastName)
                Text(student.fact)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class GetData: ObservableObject {
    
    @Published var students = [DataLayout]()
    
    init() {
        load()
    }
    
    func load() {
        guard let dataUrl = URL(string: "https://nmidev.xyz/db5/all.php") else {
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
                let decodedLists = try decoder.decode([DataLayout].self, from: data)
                DispatchQueue.main.async {
                    self.students = decodedLists
                }
            } catch {
                print("Decoding Error: \(error)")
            }
        }.resume()
    }
}

struct DataLayout: Codable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let fact: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case fact = "fact"
        case id = "counter"
    }
}
