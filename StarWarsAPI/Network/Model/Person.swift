import Foundation

public struct Person {
    let birthYear       :String;
    let eyeColor        :String;
    let gender          :String;
    let hairColor       :String;
    let height          :String;
    let homeWorld       :String
    let mass            :String;
    let name            :String;
    let skinColor       :String
    let url             :String;
    let filmURLs        :[String];
    let vehicleURLs     :[String];
    let starshipURLs    :[String];
    let speciesURLs     :[String];
}

extension Person: Decodable {
    enum PersonKeys: String, CodingKey {
        case birthYear      = "birth_year"
        case eyeColor       = "eye_color"
        case filmURLs       = "films"
        case gender
        case hairColor      = "hair_color"
        case height
        case homeworld
        case mass
        case name
        case skinColor      = "skin_color"
        case speciesURLs    = "species"
        case starshipURLs   = "starships"
        case url
        case vehicleURLs    = "vehicles"
    }
    
    public init(from decoder: Decoder) throws {
        let person = try decoder.container(keyedBy: PersonKeys.self)
        
        birthYear       = try person.decode(String.self     , forKey: .birthYear)
        eyeColor        = try person.decode(String.self     , forKey: .eyeColor)
        filmURLs        = try person.decode([String].self   , forKey: .filmURLs)
        gender          = try person.decode(String.self     , forKey: .gender)
        hairColor       = try person.decode(String.self     , forKey: .hairColor)
        height          = try person.decode(String.self     , forKey: .height)
        homeWorld       = try person.decode(String.self     , forKey: .homeworld)
        mass            = try person.decode(String.self     , forKey: .mass)
        name            = try person.decode(String.self     , forKey: .name)
        skinColor       = try person.decode(String.self     , forKey: .skinColor)
        speciesURLs     = try person.decode([String].self   , forKey: .speciesURLs)
        starshipURLs    = try person.decode([String].self   , forKey: .starshipURLs)
        url             = try person.decode(String.self     , forKey: .url)
        vehicleURLs     = try person.decode([String].self   , forKey: .vehicleURLs)
        
    }
}



