//
//  ViewController.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/12/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import UIKit

class PersonVC: UIViewController {
    
    //MARK: - Local Variables
    var mainCharacters: [MainCharacter] = [MainCharacter]()
    var person: Person!
    var nrm: NetworkRequestManager = NetworkRequestManager();
    
    //MARK: - IBoutlets
    @IBOutlet weak var nameLabel        : UILabel!
    @IBOutlet weak var heightLabel      : UILabel!
    @IBOutlet weak var massLabel        : UILabel!
    @IBOutlet weak var hairColorLabel   : UILabel!
    @IBOutlet weak var birthLabelLabel  : UILabel!
    @IBOutlet weak var genderLabel      : UILabel!
    @IBOutlet weak var homeworldbutton  : UIButton!
    @IBOutlet weak var starshipButton   : UIButton!
    @IBOutlet weak var filmButton       : UIButton!
    @IBOutlet weak var vehicleButton    : UIButton!
    @IBOutlet weak var mainCharactersCV : UICollectionView!
    
    //MARK: - IBActions
    @IBAction func randomButtonPressed(_ sender: Any) {
        let randomInt = Int.random(in: 1 ... 87)
        
        nrm.getGeneric(forEndpoint: SWAPI.person(id: randomInt)) { (passedPerson : Person?, passedError: Error?) in
            
            //            self.updateView(for: obj)
            //            self.person = obj
        }
    }
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buildMainCharacterArray()
        mainCharactersCV.delegate   = self
        mainCharactersCV.dataSource = self
        
        mainCharactersCV.reloadData()
    }
    
    //MARK: - Utility
    func buildMainCharacterArray() {
        mainCharacters.append(MainCharacter(characterName: "Luke Skywalker", imageName: "luke.png", characterSearchString: "skywalker"))
        mainCharacters.append(MainCharacter(characterName: "Obi-Wan Kenobi", imageName: "obiwan.png", characterSearchString: "obi"))
        //mainCharacters.append(MainCharacter(characterName: "Princess Leia", imageName: "princess.png", characterSearchString: "princess"))
        mainCharacters.append(MainCharacter(characterName: "Yoda", imageName: "yoda.png", characterSearchString: "yoda"))
        mainCharacters.append(MainCharacter(characterName: "Hans Solo", imageName: "hans.png", characterSearchString: "solo"))
        //mainCharacters.append(MainCharacter(characterName: "Jabaa The Hut", imageName: "jabaa.png", characterSearchString: "jabaa"))
        mainCharacters.append(MainCharacter(characterName: "R2D2", imageName: "r2d2.png", characterSearchString: "r2"))
        mainCharacters.append(MainCharacter(characterName: "Darth Vader", imageName: "vader", characterSearchString: "vader"))
        mainCharacters.append(MainCharacter(characterName: "Palpatine", imageName: "palpatine.png", characterSearchString: "palpatine"))
        mainCharacters.append(MainCharacter(characterName: "Chewbacca", imageName: "chewy.png", characterSearchString: "chewbacca"))
    }
    
    //MARK: - View
    func updateView(for person: Person) {
        nameLabel.text              = person.name
        heightLabel.text            = person.height
        massLabel.text              = person.mass
        hairColorLabel.text         = person.hairColor
        birthLabelLabel.text        = person.birthYear
        genderLabel.text            = person.gender
        
        starshipButton.isEnabled    = !person.starshipURLs.isEmpty
        vehicleButton.isEnabled     = !person.vehicleURLs.isEmpty
        homeworldbutton.isEnabled   = !person.homeWorld.isEmpty
        filmButton.isEnabled        = !person.filmURLs.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var dest = segue.destination as? PersonProtocol {
            dest.person = person
        }
    }
}

//MARK: - Protocol Definition
protocol PersonProtocol {
    var person: Person! { get set }
}

//MARK: - Collection View Extension
extension PersonVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCharacterCell", for: indexPath) as? MainCharacterCell {
            cell.setupCell(for: mainCharacters[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchString            = mainCharacters[indexPath.row].characterSearchString
        let searchURL               = "https://swapi.co/api/people/"
        var urlComponents           = URLComponents(string: searchURL)
        urlComponents?.queryItems   = [ URLQueryItem(name: "search", value: searchString)]
        
        nrm.getGeneric(forEndpoint: SWAPI.staticURL(url: (urlComponents?.url?.absoluteString)!)) { (passedPersonSearchResult: PersonSearchResult?, passedError: Error?) in
            
            if let personSearchResult = passedPersonSearchResult {
                if personSearchResult.results.count > 0 {
                    self.person = personSearchResult.results[0]
                    self.updateView(for: personSearchResult.results[0])
                }
            }
        }
    }
}
