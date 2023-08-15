//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Zdeněk Vychodil on 08.08.2023.
//

import SwiftUI


final class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []
    
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
