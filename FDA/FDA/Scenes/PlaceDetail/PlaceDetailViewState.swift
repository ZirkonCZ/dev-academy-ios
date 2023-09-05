//
//  PlaceDetailViewState.swift
//  DevAcademy
//
//  Created by Zdeněk Vychodil on 08.08.2023.
//

import SwiftUI

struct PlaceDetailViewState: DynamicProperty {
    private let place: Place
    
    @EnvironmentObject private var placesObject: PlacesObservableObject
    
    init(place: Place) {
        self.place = place
    }
    
    var druh: String {
        place.properties.druh.rawValue
    }
    var obrId1: URL? {
        place.properties.obrId1
    }
    var nazev: String {
        place.properties.nazev
    }
    var first: Place? {
        Places.mock.places.first
    }
    
    var isFavourite: Binding<Bool> {
        .init {
            placesObject.favouritePlaces?.contains(place.properties.ogcFid) ?? false
        } set: {
            newValue in placesObject.set(place: self.place, favourite: newValue);
        }
    }
    // why is this a legit syntax? I don't get it, what means `newValue in`, where newValue is a local var already in use in set(place, favourite) call
}
