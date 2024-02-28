import SwiftUI

struct ProgressIndicator: View {
    
    @State private var angle: Double = 0.00
    
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red:107/255, green: 116/255, blue: 179/255)]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        VStack {
            
            Text("Loading...")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
            
            ZStack {
                Circle()
                    .stroke(Color(.systemGray6), lineWidth: 20)
                    .frame(width: 300, height: 300)
                Circle()
                    .trim(from: 0, to: angle)
                    .stroke(purpleGradient, lineWidth: 20)
                    .frame(width: 300, height: 300)
                    .overlay {
                        VStack {
                            Text("\(Int(angle * 100))%")
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                                .foregroundColor(.gray)
                            Text("Complete")
                                .font(.system(.body, design: .rounded))
                                .bold()
                                .foregroundColor(.gray)
                        }
                    }
            }
            .padding()
            
            Slider(value: $angle, in: 0...1)
                .padding()
            
            Text("The current progress is \(Int(angle * 100))%")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicator()
    }
}
