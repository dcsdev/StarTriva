//
//  PlanetVC.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/20/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import UIKit

class PlanetVC: UIViewController, PersonProtocol {
    //MARK: - Local Variables
    var person: Person!
    var nrm: NetworkRequestManager = NetworkRequestManager();
    
    //MARK: - IBOutlets
    @IBOutlet weak var worldNameLabel   : UILabel!
    @IBOutlet weak var climateLabel     : UILabel!
    @IBOutlet weak var gravityLabel     : UILabel!
    @IBOutlet weak var terrainLabel     : UILabel!
    @IBOutlet weak var populationLabel  : UILabel!
    @IBOutlet weak var diameterLabel    : UILabel!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        nrm.getGeneric(forEndpoint: SWAPI.staticURL(url: person.homeWorld)) { (passedHomeworld:Planet?
            , passedError : Error?) in
            if let homeworld = passedHomeworld {
                self.updateView(for: homeworld)
            } else {
                if let error = passedError {
                    debugPrint(error)
                }
            }
        }
    }
    
    //MARK: - View
    func updateView(for planet: Planet) {
        worldNameLabel.text     = planet.name
        climateLabel.text       = planet.climate
        gravityLabel.text       = planet.gravity
        terrainLabel.text       = planet.terrain
        populationLabel.text    = planet.population
        diameterLabel.text      = planet.diameter
    }
}
