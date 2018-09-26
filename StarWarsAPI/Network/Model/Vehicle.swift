//
//  Vehicle.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/18/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import Foundation

/*
 "cargo_capacity": "50000",
 "consumables": "2 months",
 "cost_in_credits": "150000",
 "created": "2014-12-10T15:36:25.724000Z",
 "crew": "46",
 "edited": "2014-12-10T15:36:25.724000Z",
 "length": "36.8",
 "manufacturer": "Corellia Mining Corporation",
 "max_atmosphering_speed": "30",
 "model": "Digger Crawler",
 "name": "Sand Crawler",
 "passengers": "30",
 "pilots": [],
 "films": [
 "https://swapi.co/api/films/1/"
 ],
 "url": "https://swapi.co/api/vehicles/4/",
 "vehicle_class": "wheeled"
 */


public struct Vehicle {
    let cargoCapacity           : String
    let consumables             : String
    let costInCredits           : String
    let created                 : String
    let crew                    : String
    let edited                  : String
    let length                  : String
    let manufacturer            : String
    let maxAtmospheringSpeed    : String
    let model                   : String
    let name                    : String
    let passengers              : String
    let filmURLs                : [String]
    let pilotURLs               : [String]
    let vehicleClass           : String
    let url                     : String
}

extension Vehicle: Decodable {
    enum VehicleCodingKeys: String, CodingKey {
        case cargoCapacity          = "cargo_capacity"
        case consumables
        case costInCredits          = "cost_in_credits"
        case created
        case crew
        case edited
        case length
        case manufacturer
        case maxAtmospheringSpeed   = "max_atmosphering_speed"
        case model
        case name
        case passengers
        case filmURLs               = "films"
        case pilotURLs              = "pilots"
        case vehicleClass           = "vehicle_class"
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let vehicle = try decoder.container(keyedBy: VehicleCodingKeys.self)

        cargoCapacity           = try vehicle.decode(String.self    , forKey: .cargoCapacity)
        consumables             = try vehicle.decode(String.self    , forKey: .consumables)
        costInCredits           = try vehicle.decode(String.self    , forKey: .costInCredits)
        created                 = try vehicle.decode(String.self    , forKey: .created)
        crew                    = try vehicle.decode(String.self    , forKey: .crew)
        edited                  = try vehicle.decode(String.self    , forKey: .edited)
        length                  = try vehicle.decode(String.self    , forKey: .length)
        manufacturer            = try vehicle.decode(String.self    , forKey: .manufacturer)
        maxAtmospheringSpeed    = try vehicle.decode(String.self    , forKey: .maxAtmospheringSpeed)
        model                   = try vehicle.decode(String.self    , forKey: .model)
        name                    = try vehicle.decode(String.self    , forKey: .name)
        passengers              = try vehicle.decode(String.self    , forKey: .passengers)
        filmURLs                = try vehicle.decode([String].self  , forKey: .filmURLs)
        pilotURLs               = try vehicle.decode([String].self  , forKey: .pilotURLs)
        vehicleClass           = try vehicle.decode(String.self     , forKey: .vehicleClass)
        url                     = try vehicle.decode(String.self    , forKey: .url)
    }
}
