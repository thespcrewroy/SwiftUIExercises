import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                
                NavigationLink(destination: MapView(
                    thelat: 28.421952,
                    thelong: -81.582573,
                    pickMap: 2,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ) {
                    Text("Disney World Standard")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .red,
                    endColor: .orange)
                )
                
                NavigationLink(destination: MapView(
                    thelat: 28.421952,
                    thelong: -81.582573,
                    pickMap: 1,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ) {
                    Text("Disney World Satelite")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .red,
                    endColor: .orange)
                )
                
                NavigationLink(destination: MapView(
                    thelat: 28.421952,
                    thelong: -81.582573,
                    pickMap: 0,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ) {
                    Text("Disney World Hybrid")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .red,
                    endColor: .orange)
                )
                
                NavigationLink(destination: MapView(
                    thelat: 39.118262,
                    thelong: -120.065582,
                    pickMap: 2,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ){
                    Text("Lake Tahoe Standard")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .blue,
                    endColor: .purple)
                )
                
                NavigationLink(destination: MapView(
                    thelat: 39.118262,
                    thelong: -120.065582,
                    pickMap: 1,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ){
                    Text("Lake Tahoe Satelite")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .blue,
                    endColor: .purple)
                )
                
                NavigationLink(destination: MapView(
                    thelat: 39.118262,
                    thelong: -120.065582,
                    pickMap: 2,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ){
                    Text("Lake Tahoe Hybrid")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .blue,
                    endColor: .purple)
                )
                
                
                NavigationLink(destination: MapView(
                    thelat: 28.910941,
                    thelong: -82.613346,
                    pickMap: 2,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ) {
                    Text("Crystal River Standard")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .green,
                    endColor: .yellow)
                )
                
                NavigationLink(destination: MapView(
                    thelat: 28.910941,
                    thelong: -82.613346,
                    pickMap: 1,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ) {
                    Text("Crystal River Satelite")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .green,
                    endColor: .yellow)
                )
                
                NavigationLink(destination: MapView(
                    thelat: 28.910941,
                    thelong: -82.613346,
                    pickMap: 0,
                    latitudeDelta: Double.random(in: 0.01...0.1),
                    longitudeDelta: Double.random(in: 0.01...0.1))
                ) {
                    Text("Crystal River Hybrid")
                }
                .buttonStyle(GradientButtonStyle(
                    startColor: .green,
                    endColor: .yellow)
                )
                .navigationTitle("Choose a Location")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
    
    
    struct GradientButtonStyle: ButtonStyle {
        var startColor: Color
        var endColor: Color
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(minWidth: 0, maxWidth: 200) // Ensures the button takes the full width available
                .frame(height: 20) // Specifies a fixed height for each button
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
                .padding(.horizontal, 15)
                .foregroundColor(.white)
                .bold()
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


