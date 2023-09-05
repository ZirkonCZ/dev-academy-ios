import SwiftUI
import MapKit

struct PlaceDetailView: View {
    var viewState: PlaceDetailViewState
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .center) {
                        Text(viewState.druh)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Button {
                            viewState.isFavourite.wrappedValue.toggle()
                        } label: {
                            Image(systemName: viewState.isFavourite.wrappedValue ? "heart.fill" : "heart")
                                .foregroundColor(Color.red)
                        }
                    }
                    .padding([.horizontal, .bottom])

                AsyncImage(url: viewState.obrId1) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1))
                } placeholder: {
                    ProgressView()
                }
                .padding(.horizontal)

                Spacer(minLength: 20)
                
//              if I'll be bored, I would move this to ViewState after finishing the map from ex04, which is a bonus task
//                MapView(coordinate: CLLocationCoordinate2D(latitude: place.geometry.latitude, longitude: place.geometry.longitude))
//                    .frame(height: 300)
//                    .cornerRadius(10)
//                    .overlay(RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.gray.opacity(0.2), lineWidth: 1))
//                    .padding(.horizontal)
//                Spacer()
            }
            .navigationTitle(Text(viewState.nazev))
        }
    }
}



//struct PlaceDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceDetailView(place: Places.mock.places.first!)
//    }
//}


