import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var thelat: Double
    var thelong: Double
    var pickMap: Int
    var whichMap = [MKMapType.hybridFlyover, MKMapType.satelliteFlyover, MKMapType.standard]
    var latitudeDelta: Double // Added variable for latitude delta
    var longitudeDelta: Double // Added variable for longitude delta
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: thelat, longitude: thelong)
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        uiView.mapType = whichMap[pickMap]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(thelat: 34.011286, thelong: -116.166868, pickMap: 0, latitudeDelta: 0.05, longitudeDelta: 0.05)
    }
}
