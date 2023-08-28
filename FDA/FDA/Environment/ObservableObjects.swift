import Foundation

// MARK: - ObservableObjects

final class ObservableObjects {
    let features: PlacesObservableObject
    
    init(
        features: PlacesObservableObject
    ) {
        self.features = features
    }
}

// MARK: - ObservableObjects + Extension

extension ObservableObjects {
    convenience init(services: Services) { // idk
        let features = PlacesObservableObject(placesService: ProductionPlacesServices())
        
        self.init(
            features: features
        )
    }
}

// MARK: - Mocks

extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects(services: .mock)
}
