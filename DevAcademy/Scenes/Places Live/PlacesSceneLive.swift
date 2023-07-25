import SwiftUI

struct PlacesSceneLive: View {
    let features: [Feature] = Features.mock.features
    
    var body: some View {
        List(features, id: \.properties.ogcFid) {
            feature in
            Text(feature.properties.nazev)
        }
        .listStyle(.plain)
    }
}

struct PlacesSceneLive_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRowLive()
    }
}
