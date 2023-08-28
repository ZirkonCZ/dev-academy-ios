//
//  PlacesService.swift
//  FDA
//
//  Created by Zdeněk Vychodil on 15.08.2023.
//

import Foundation

enum APIError: Error {
    case invalidData
    case invalidResponse
    case decodingError(Error)
}

protocol PlacesService {
    func placesWithAsync() async throws -> Places
}

final class ProductionPlacesServices : PlacesService {
    func placesWithAsync() async throws -> Places {
        let session = URLSession.shared
        let url = URL(string: "https://gis.brno.cz/ags1/rest/services/OMI/omi_ok_kulturni_instituce/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, response) = try await session.data(for: request)
        guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
            throw APIError.invalidResponse
        }
        return try JSONDecoder().decode(Places.self, from: data)
    }
}
