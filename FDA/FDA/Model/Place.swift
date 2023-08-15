struct Place: Decodable {
    var geometry: Point?
    var properties: Properties
    
    enum CodingKeys: String, CodingKey {
        case geometry
        case properties = "attributes"
    }
}
