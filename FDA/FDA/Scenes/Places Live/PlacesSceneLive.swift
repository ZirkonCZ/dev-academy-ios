import SwiftUI

struct PlacesSceneLive: View {
    @State var features: [Feature] = []
    
    var body: some View {
        NavigationStack {
            Group {
                if !features.isEmpty {
                    List(features, id: \.properties.ogcFid) {
                        feature in
                        PlacesRowLive(feature: feature)
                            .onTapGesture {
                                tapped(on: feature)
                            }
                    }
                    .animation(.default, value: features)
                    .listStyle(.plain)
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Kultůrmapa")
        }
        .onAppear(perform: fetch)
    }
    
    func tapped(on feature: Feature) {
        features.removeAll(where: { $0.properties.ogcFid == feature.properties.ogcFid })
    }
    
    func fetch() {
        DataService.shared.fetchData { result in
            switch result {
            case .success(let features):
                self.features = features.features
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
