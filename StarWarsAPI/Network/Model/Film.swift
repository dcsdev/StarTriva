//
//  Film.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/17/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import Foundation
/*
"characters": [
],
"created": "2014-12-10T14:23:31.880000Z",
"director": "George Lucas",
"edited": "2014-12-12T11:24:39.858000Z",
"episode_id": 4,
"opening_crawl": "",
"planets": [
],
"producer": "Gary Kurtz, Rick McCallum",
"release_date": "1977-05-25",
"species": [
],
"starships": [
],
"title": "A New Hope",
"url": "https://swapi.co/api/films/1/",
"vehicles": [
]
*/


import Foundation

public struct Film {
    let characters          :[String];
    let created             :String;
    let director            :String;
    let edited              :String;
    let epidsodeID          :Int;
    let openingCrwal        :String
    let planets             :[String];
    let producer            :String;
    let releaseDate         :String
    let species             :[String];
    let starshipsURLs       :[String];
    let title               :String;
    let url                 :String;
    let vehicleURLs         :[String];
}

extension Film: Decodable {
    enum FilmKeys: String, CodingKey {
        case characters
        case created
        case director
        case edited
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case planets
        case producer
        case release_date
        case species
        case starshipURLs = "starships"
        case title
        case url
        case vehicleURLs = "vehicles"
    }
    
    public init(from decoder: Decoder) throws {
        let film        = try decoder.container(keyedBy: FilmKeys.self)
        
        characters      = try film.decode([String].self , forKey: .characters)
        created         = try film.decode(String.self   , forKey: .created)
        director        = try film.decode(String.self   , forKey: .director)
        edited          = try film.decode(String.self   , forKey: .edited)
        epidsodeID      = try film.decode(Int.self      , forKey: .episodeID)
        openingCrwal    = try film.decode(String.self   , forKey: .openingCrawl)
        planets         = try film.decode([String].self , forKey: .planets)
        producer        = try film.decode(String.self   , forKey: .producer)
        releaseDate     = try film.decode(String.self   , forKey: .release_date)
        species         = try film.decode([String].self , forKey: .species)
        starshipsURLs   = try film.decode([String].self , forKey: .starshipURLs)
        title           = try film.decode(String.self   , forKey: .title)
        url             = try film.decode(String.self   , forKey: .url)
        vehicleURLs     = try film.decode([String].self , forKey: .vehicleURLs)
        
        
    }
}



