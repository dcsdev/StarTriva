//
//  MainCharacterCell.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/23/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import UIKit

class MainCharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageCell: UIImageView!
    
    func setupCell(for mainCharacter: MainCharacter) {
        characterImageCell.image = UIImage(named: mainCharacter.imageName)
    }
}
