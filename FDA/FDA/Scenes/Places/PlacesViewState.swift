//
//  PlacesViewState.swift
//  DevAcademy
//
//  Created by Zdeněk Vychodil on 08.08.2023.
//

import SwiftUI

struct PlacesViewState: DynamicProperty {
    @EnvironmentObject private var placesObservableObject: PlacesObservableObject
    @State var showFavorites = false

    var places: [Place] {
        placesObservableObject.places
    }
    
    var placesEmpty: Bool {
        return places.isEmpty
    }
    
    func favoritesPressed() {
        showFavorites = showFavorites ? false : true
    }
    
    func fetchPlacesWithAsync() async {
        await placesObservableObject.fetch()
    }
}
