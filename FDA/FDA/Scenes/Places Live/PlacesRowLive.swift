import SwiftUI

struct PlacesRowLive: View {
    let feature: Feature
    
    var body: some View {
        HStack {
            AsyncImage(url: feature.properties.obrId1) {
                image in
                image
                    .resizable()
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(feature.properties.nazev)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(feature.properties.druh.rawValue)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

struct PlacesRowLive_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRowLive(feature: Features.mock.features[0])
    }
}
