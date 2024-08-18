import SwiftUI

struct ContentView: View {
    
    @State private var angle: Double = 0
    
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 160, startAngle: .degrees(angle), endAngle: .degrees(0), clockwise: true)
            }
            .fill(.yellow)
            VStack {
                Slider(value: $angle, in: 0...360)
                    .padding()
                Text("The current angle is \(angle, specifier: "%.0f")")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
