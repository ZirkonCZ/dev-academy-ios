//
//  PlaceDetailViewState.swift
//  DevAcademy
//
//  Created by Zdeněk Vychodil on 08.08.2023.
//

import SwiftUI

struct PlaceDetailViewState: DynamicProperty {
    private let place: Place
    
    init(place: Place) {
        self.place = place
    }
    
    var druh: String {
        place.properties.druh.rawValue
    }
    var obrId1: URL {
        place.properties.obrId1
    }
    var nazev: String {
        place.properties.nazev
    }
    var first: Place? {
        Places.mock.places.first
    }
}
