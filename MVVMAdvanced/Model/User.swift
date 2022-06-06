import Foundation

struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case id, name, email, address, phone, website, company
        case userName = "username"
    }
    
    let id: Int
    let name: String
    let userName: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Codable {
    enum CodingKeys: String, CodingKey {
        case street, suite, city, geo
        case zipCode = "zipcode"
    }
    
    let street: String
    let suite: String
    let city: String
    let zipCode: String
    let geo: Geo
    
}

struct Geo: Codable {
    enum CodingKeys: String, CodingKey {
        case lat, lng
    }
    
    let lat: String
    let lng: String
}

struct Company: Codable {
    enum CodingKeys: String, CodingKey {
        case name, catchPhrase, bs
    }

    let name: String
    let catchPhrase: String
    let bs: String
}
