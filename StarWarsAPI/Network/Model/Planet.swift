//
//  Planets.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/18/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import Foundation

/*
 "climate": "Arid",
 "created": "2014-12-09T13:50:49.641000Z",
 "diameter": "10465",
 "edited": "2014-12-15T13:48:16.167217Z",
 "films": [
 "https://swapi.co/api/films/1/",
 ...
 ],
 "gravity": "1",
 "name": "Tatooine",
 "orbital_period": "304",
 "population": "120000",
 "residents": [
 "https://swapi.co/api/people/1/",
 ...
 ],
 "rotation_period": "23",
 "surface_water": "1",
 "terrain": "Dessert",
 "url": "https://swapi.co/api/planets/1/"
 */

public struct Planet {
    let climate             : String
    let created             : String
    let diameter            : String
    let edited              : String
    let gravity             : String
    let name                : String
    let orbitalPeriod       : String
    let population          : String
    let residents           : [String]
    let rotationPeriod      : String
    let surfaceWater        : String
    let filmURLs            : [String]
    let terrain             : String
    let url                 : String
}

extension Planet: Decodable {
    enum PlanetCodingKeys: String, CodingKey {
        case climate
        case created
        case diameter
        case edited
        case gravity
        case name
        case oribitalPeriod     = "orbital_period"
        case population
        case residents
        case rotationPeriod     = "rotation_period"
        case surfaceWater       = "surface_water"
        case filmURLs           = "films"
        case terrain
        case url
}

    public init(from decoder: Decoder) throws {
        let planet = try decoder.container(keyedBy: PlanetCodingKeys.self)
        
        climate         = try planet.decode(String.self     , forKey: .climate)
        created         = try planet.decode(String.self     , forKey: .created)
        diameter        = try planet.decode(String.self     , forKey: .diameter)
        edited          = try planet.decode(String.self     , forKey: .edited)
        gravity         = try planet.decode(String.self     , forKey: .gravity)
        name            = try planet.decode(String.self     , forKey: .name)
        orbitalPeriod   = try planet.decode(String.self     , forKey: .oribitalPeriod)
        population      = try planet.decode(String.self     , forKey: .population)
        residents       = try planet.decode([String].self   , forKey: .residents)
        rotationPeriod  = try planet.decode(String.self     , forKey: .rotationPeriod)
        surfaceWater    = try planet.decode(String.self     , forKey: .surfaceWater)
        filmURLs        = try planet.decode([String].self   , forKey: .filmURLs)
        terrain         = try planet.decode(String.self     , forKey: .terrain)
        url             = try planet.decode(String.self     , forKey: .url)
    }
}

