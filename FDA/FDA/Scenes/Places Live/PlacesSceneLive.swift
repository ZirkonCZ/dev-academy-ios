import SwiftUI

struct PlacesSceneLive: View {
    @State var places: [Places] = [] // singular?
    
    var body: some View {
        NavigationStack {
            Group {
                if !places.isEmpty {
                    List(places, id: \.properties.ogcFid) {
                        place in
                        PlacesRowLive(place: place)
                            .onTapGesture {
                                tapped(on: place)
                            }
                    }
                    .animation(.default, value: places)
                    .listStyle(.plain)
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Kultůrmapa")
        }
        .onAppear(perform: fetch)
    }
    
    func tapped(on place: Place) {
        places.removeAll(where: { $0.properties.ogcFid == place.properties.ogcFid })
    }
    
    func fetch() {
        DataService.shared.fetchData { result in
            switch result {
            case .success(let places):
                self.places = places.places
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct PlacesSceneLive_Previews: PreviewProvider {
    static var previews: some View {
        PlacesSceneLive()
    }
}
