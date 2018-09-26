//
//  Starship.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/18/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import Foundation

/*
"MGLT": "10 MGLT",
"cargo_capacity": "1000000000000",
"consumables": "3 years",
"cost_in_credits": "1000000000000",
"created": "2014-12-10T16:36:50.509000Z",
"crew": "342953",
"edited": "2014-12-10T16:36:50.509000Z",
"hyperdrive_rating": "4.0",
"length": "120000",
"manufacturer": "Imperial Department of Military Research, Sienar Fleet Systems",
"max_atmosphering_speed": "n/a",
"model": "DS-1 Orbital Battle Station",
"name": "Death Star",
"passengers": "843342",
"films": [
"https://swapi.co/api/films/1/"
],
"pilots": [],
"starship_class": "Deep Space Mobile Battlestation",
"url": "https://swapi.co/api/starships/9/"
*/


public struct Starship {
    let mglt                    : String
    let cargoCapacity           : String
    let consumables             : String
    let costInCredits           : String
    let created                 : String
    let crew                    : String
    let edited                  : String
    let hyperDriveRating        : String
    let length                  : String
    let manufacturer            : String
    let maxAtmospheringSpeed    : String
    let model                   : String
    let name                    : String
    let passengers              : String
    let filmURLs                : [String]
    let pilotURLs               : [String]
    let starshipClass           : String
    let url                     : String
}

extension Starship: Decodable {
    enum StarshipCodingKeys: String, CodingKey {
        case mglt                   = "MGLT"
        case cargoCapacity          = "cargo_capacity"
        case consumables
        case costInCredits          = "cost_in_credits"
        case created
        case crew
        case edited
        case hyperDriveRating       = "hyperdrive_rating"
        case length
        case manufacturer
        case maxAtmospheringSpeed   = "max_atmosphering_speed"
        case model
        case name
        case passengers
        case filmURLs               = "films"
        case pilotURLs              = "pilots"
        case starshipClass          = "starship_class"
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let starship = try decoder.container(keyedBy: StarshipCodingKeys.self)
        
        mglt                    = try starship.decode(String.self   , forKey: .mglt)
        cargoCapacity           = try starship.decode(String.self   , forKey: .cargoCapacity)
        consumables             = try starship.decode(String.self   , forKey: .consumables)
        costInCredits           = try starship.decode(String.self   , forKey: .costInCredits)
        created                 = try starship.decode(String.self   , forKey: .created)
        crew                    = try starship.decode(String.self   , forKey: .crew)
        edited                  = try starship.decode(String.self   , forKey: .edited)
        hyperDriveRating        = try starship.decode(String.self   , forKey: .hyperDriveRating)
        length                  = try starship.decode(String.self   , forKey: .length)
        manufacturer            = try starship.decode(String.self   , forKey: .manufacturer)
        maxAtmospheringSpeed    = try starship.decode(String.self   , forKey: .maxAtmospheringSpeed)
        model                   = try starship.decode(String.self   , forKey: .model)
        name                    = try starship.decode(String.self   , forKey: .name)
        passengers              = try starship.decode(String.self   , forKey: .passengers)
        filmURLs                = try starship.decode([String].self , forKey: .filmURLs)
        pilotURLs               = try starship.decode([String].self , forKey: .pilotURLs)
        starshipClass           = try starship.decode(String.self   , forKey: .starshipClass)
        url                     = try starship.decode(String.self   , forKey: .url)
    }
}
