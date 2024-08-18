import SwiftUI

struct CrazyImage: View {
    var body: some View {
        ZStack {
            Image("pan")
                .resizable()
            ZStack {
                Circle()
                    .trim(from: 0.1, to: 0.9)
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [10]))
                Path { path in
                    path.move(to: CGPoint(x: 50, y: 50))
                    path.addCurve(to: CGPoint(x: 150, y: 200), control1: CGPoint(x: 100, y: 0), control2: CGPoint(x: 200, y: 300))
                    path.addCurve(to: CGPoint(x: 50, y: 50), control1: CGPoint(x: 0, y: 200), control2: CGPoint(x: 100, y: 0))
                }
                .stroke(Color.blue, lineWidth: 5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CrazyImage()
    }
}
