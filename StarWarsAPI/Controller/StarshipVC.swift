//
//  StarshipVC.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/20/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import UIKit

class StarshipVC: UIViewController, PersonProtocol {
    //MARK: - Local Variables
    var person: Person!
    var starshipIndex = 0
    var nrm: NetworkRequestManager = NetworkRequestManager();
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel            : UILabel!
    @IBOutlet weak var manufacturerLabel    : UILabel!
    @IBOutlet weak var modelLabel           : UILabel!
    @IBOutlet weak var starshipClassLabel   : UILabel!
    @IBOutlet weak var maxSpeedLabel        : UILabel!
    @IBOutlet weak var mglt                 : UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nrm.getGeneric(forEndpoint: SWAPI.staticURL(url: person.starshipURLs.first!)) { (passedStarShip: Starship?, passedError: Error?) in
            if let starShip = passedStarShip {
                self.updateView(for: starShip)
            } else {
                if let error = passedError {
                    debugPrint(error)
                }
            }
        }
        
        previousButton.isEnabled    = false
        nextButton.isEnabled        = person.starshipURLs.count > 1
    }
    
    //MARK: - IBActions
    @IBAction func previousButtonPresed(_ sender: Any) {
        starshipIndex -= 1
        
        previousButton.isEnabled    =  getButtonState(currentIndex: starshipIndex, arr: person.filmURLs, buttonType: .Previous)
        nextButton.isEnabled        =  getButtonState(currentIndex: starshipIndex, arr: person.filmURLs, buttonType: .Next)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        starshipIndex += 1
        previousButton.isEnabled    =  getButtonState(currentIndex: starshipIndex, arr: person.filmURLs, buttonType: .Previous)
        nextButton.isEnabled        =  getButtonState(currentIndex: starshipIndex, arr: person.filmURLs, buttonType: .Next)
    }
    
    //MARK: - View
    func updateView(for starShip: Starship) {
        
        nameLabel.text          = starShip.name
        manufacturerLabel.text  = starShip.manufacturer
        modelLabel.text         = starShip.model
        starshipClassLabel.text = starShip.starshipClass
        maxSpeedLabel.text      = starShip.maxAtmospheringSpeed
        mglt.text               = starShip.mglt
    }
}
