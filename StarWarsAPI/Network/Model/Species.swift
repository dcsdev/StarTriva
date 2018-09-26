//
//  Species.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/18/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import Foundation
/*
 "average_height": "2.1",
 "average_lifespan": "400",
 "classification": "Mammal",
 "created": "2014-12-10T16:44:31.486000Z",
 "designation": "Sentient",
 "edited": "2014-12-10T16:44:31.486000Z",
 "eye_colors": "blue, green, yellow, brown, golden, red",
 "hair_colors": "black, brown",
 "homeworld": "https://swapi.co/api/planets/14/",
 "language": "Shyriiwook",
 "name": "Wookie",
 "people": [
 "https://swapi.co/api/people/13/"
 ],
 "films": [
 "https://swapi.co/api/films/1/",
 "https://swapi.co/api/films/2/"
 ],
 "skin_colors": "gray",
 "url": "https://swapi.co/api/species/3/"
 */

public struct Species {
    let avgHeight   :String
    let avgLifeSpan :String
    let classification :String
    let created         :String
    let designation     : String
    let edited          : String
    let eyeColors       : String
    let hairColors      : String
    let homeWorldURL    : String
    let language        : String
    let name            : String
    let peopleURLs      : [String]
    let filmURLs        : [String]
    let skinColors      : String
    let url             : String
}

extension Species: Decodable {
    enum SpeciesCodingKeys: String, CodingKey {
        case avgHeight      = "average_height"
        case avgLifeSpan    = "average_lifespan"
        case classification
        case designation
        case created
        case edited
        case eyeColors      = "eye_colors"
        case hairColors     = "hair_colors"
        case homeWorldURL   = "homeworld"
        case language
        case peopleURLs     = "people"
        case name
        case filmURLs       = "films"
        case skinColors     = "skin_colors"
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let species = try decoder.container(keyedBy: SpeciesCodingKeys.self)
        
        avgHeight               = try species.decode(String.self    , forKey: .avgHeight)
        avgLifeSpan             = try species.decode(String.self    , forKey: .avgLifeSpan)
        classification          = try species.decode(String.self    , forKey: .classification)
        designation             = try species.decode(String.self    , forKey: .designation)
        created                 = try species.decode(String.self    , forKey: .created)
        edited                  = try species.decode(String.self    , forKey: .edited)
        name                    = try species.decode(String.self    , forKey: .name)
        filmURLs                = try species.decode([String].self  , forKey: .filmURLs)
        url                     = try species.decode(String.self    , forKey: .url)
        language                = try species.decode(String.self    , forKey: .language)
        peopleURLs              = try species.decode([String].self  , forKey: .peopleURLs)
        skinColors              = try species.decode(String.self    , forKey: .skinColors)
        hairColors              = try species.decode(String.self    , forKey: .hairColors)
        homeWorldURL            = try species.decode(String.self    , forKey: .homeWorldURL)
        eyeColors               = try species.decode(String.self    , forKey: .eyeColors)
    }
}

