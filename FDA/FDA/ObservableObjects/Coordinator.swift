//
//  Coordinator.swift
//  DevAcademy
//
//  Created by Zdeněk Vychodil on 08.08.2023.
//

import SwiftUI


final class Coordinator: ObservableObject {
    var placesScene: some View {
        PlacesView(viewState: PlacesViewState())
    }
    
    func placeDetailScene(with place: Place) -> some View {
        PlaceDetailView(viewState: PlaceDetailViewState(place: place))
    }
    
    func showFavorites() -> some View {
        Text("Zatím tady nic není")
    }
    
}
