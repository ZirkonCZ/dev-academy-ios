//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Zdeněk Vychodil on 08.08.2023.
//

import SwiftUI

final class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []
    let placesService: PlacesService

    init(placesService: PlacesService) {
        self.placesService = placesService
    }

    
    @MainActor
    func fetch() async {
        do {
            rawPlaces = try await placesService.placesWithAsync().places
        } catch {
            print("error during fetching data:\n", error)
        }
    }
    
    private var rawPlaces: [Place] = [] {
        didSet { updatePlaces() }
    }

    private(set) var favouritePlaces: [Int]? {
            get { UserDefaults.standard.array(forKey: "favourites") as? [Int] }
            set { UserDefaults.standard.set(newValue, forKey: "favourites");
                updatePlaces();
            }
        }
    
    private func updatePlaces() -> Void {
        var nonfavPlaces: [Place] = []
        var favPlaces: [Place] = []
        
        for place in rawPlaces {
            if favouritePlaces != nil && favouritePlaces!.contains(place.properties.ogcFid) {
                favPlaces.append(place)
            } else {
                nonfavPlaces.append(place)
            }
        }
        self.places = favPlaces + nonfavPlaces
    }

    func set(place: Place, favourite addFav: Bool) -> Void {
        if (addFav) {
            favouritePlaces!.append(place.properties.ogcFid)
        } else {
            favouritePlaces!.remove(at: favouritePlaces!.firstIndex(of: place.properties.ogcFid)!) // is it ok with these `!`?
        }
    }
    
}
