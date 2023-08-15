//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Zdeněk Vychodil on 08.08.2023.
//

import SwiftUI


final class PlacesObservableObject: ObservableObject {
    init(placesService: PlacesService) {
        self.placesService = placesService
    }

    @Published var places: [Place] = []
    let placesService: PlacesService
    
    @MainActor
    func fetch() async {
        do {
            places = try await placesService.placesWithAsync().places
        } catch {
            print("error during fetching data:\n", error)
        }
//        DataService.shared.fetchData { result in
//            switch result {
//            case .success(let places):
//                self.places = places.places
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
} 
