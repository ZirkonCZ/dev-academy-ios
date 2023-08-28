import Foundation

struct Properties: Decodable {
    var ogcFid: Int
    var obrId1: URL?
    var druh: PossibleKind
    var nazev: String
    
    enum CodingKeys: String, CodingKey {
        case ogcFid = "ogc_fid"
        case obrId1 = "obr_id1"
        case druh
        case nazev
    }
}
