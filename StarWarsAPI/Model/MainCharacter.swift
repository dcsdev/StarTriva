//
//  MainCharacter.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/23/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import Foundation

public struct MainCharacter {
    let characterName           : String
    let imageName               : String
    let characterSearchString   : String
    
    init(characterName: String, imageName: String, characterSearchString: String) {
        self.characterName          = characterName
        self.imageName              = imageName
        self.characterSearchString  = characterSearchString
    }
}
