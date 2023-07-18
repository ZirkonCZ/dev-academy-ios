//
//  ex2.swift
//  DevAcademy
//
//  Created by Zdeněk Vychodil on 18.07.2023.
//

import Foundation

enum Kind: String {
    case divadlo = "Divadlo"
    case galerie = "Galerie"
    case hub = "Hub"
    case hudebniKlub = "Hudebni klub"
    case kino = "Kino"
    case knihovna = "Knihovna"
    case koncertniHala = "Koncertní hala"
    case kulturniCentrum = "Kulturní centrum"
    case kulturniPamátka = "Kulturní památka"
    case letniKino = "Letní kino"
    case muzeum = "Muzeum"
    case podnikSLulturnimProgramem = "Podnik s kulturním programem"
    case vystaviste = "Výstaviště"
    case ostatni = "Ostatní"
}

enum PossibleKind: RawRepresentable {
    var rawValue: String { // read-only
        get {
            switch self {
                case .kind (let x):
                    return x.rawValue
                case .unknown (let string):
                    return string
            }
        }
    }
    
    init?(rawValue: String) {
        let x = Kind(rawValue: rawValue)
        if let y = x {
            self = .kind(y)
        } else {
            self = .unknown(rawValue)
        }
    }
    
    case kind(Kind)
    case unknown(String)
    typealias RawValue = String
}

struct Properties {
    let ogcFid: Int
    let obrId1: URL
    let druh: PossibleKind
    let nazev: String
}

struct Point {
    let latitude: Float
    let longitude: Float
}

struct Feature {
    let geometry: Point
    let properties: Properties
}

struct Features {
    let features: Array<Feature>
}

class DataService {
    private init() {}
    var shared: DataService = DataService.init()
    var data: Result<Features, Error>?

    func fetchData(clsr: (Result<Features, Error>?) -> Void) {
        if data != nil {
            clsr(data)
        }
        // X = 10 s
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false,
                             block: {[weak self] _ in let res = Result<Features, Error>.success(DataService.mockData)
            self?.data = res
            clsr(res)
        })
    }
}

extension DataService{
    private static var mockData: Features = Features(features: [Feature(geometry: Point(latitude: <#T##Float#>, longitude: <#T##Float#>), properties: Properties(ogcFid: <#T##Int#>, obrId1: <#T##URL#>, druh: PossibleKind(rawValue: <#T##String#>) ?? <#default value#>, nazev: <#T##String#>))])

}
