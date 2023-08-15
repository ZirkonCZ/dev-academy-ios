import SwiftUI
import ActivityIndicatorView

struct PlacesView: View {
    var viewState: PlacesViewState
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        NavigationStack {
            Group {
                if !viewState.placesEmpty {
                    List(viewState.places, id: \.properties.nazev) { place in
                        NavigationLink(destination: coordinator.placeDetailScene(with: place)) {
                            PlaceRow(place: place)
                        }
                    }
                    .listStyle(.plain)
                } else {
                     ActivityIndicatorView(isVisible: .constant(true), type: .growingCircle)
                }
            }
            .navigationTitle("Kultůrmapa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Oblíbené") {
                        viewState.favoritesPressed()
                    }
                }
            }
        }
        .task({
            await viewState.fetchPlacesWithAsync()
        })
        .sheet(isPresented: viewState.$showFavorites) {
            coordinator.showFavorites()
        }
    }

}

//struct PlacesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlacesView()
//    }
//}
