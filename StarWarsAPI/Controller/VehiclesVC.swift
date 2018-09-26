//
//  VehiclesVC.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/20/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import UIKit

class VehicleVC: UIViewController, PersonProtocol {
    //MARK: - Local Variables
    var person: Person!
    var nrm: NetworkRequestManager = NetworkRequestManager();
    var vehicleIndex = 0
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel        : UILabel!
    @IBOutlet weak var manufactuerLabel : UILabel!
    @IBOutlet weak var maxSpeedLabel    : UILabel!
    @IBOutlet weak var modelLabel       : UILabel!
    @IBOutlet weak var passengersLabel  : UILabel!
    @IBOutlet weak var vehicleClass     : UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        nrm.getGeneric(forEndpoint: SWAPI.staticURL(url: person.vehicleURLs.first!)) { (passedVehicle: Vehicle?, passedError: Error?) in
            if let vehicle = passedVehicle {
                self.updateView(for: vehicle)
            } else {
                if let error = passedError {
                    debugPrint(error)
                }
            }
        }
        
        
        previousButton.isEnabled    = false
        nextButton.isEnabled        = person.vehicleURLs.count > 1
    }
    
    @IBAction func previousButtonPresed(_ sender: Any) {
        vehicleIndex -= 1
        
        previousButton.isEnabled    =  getButtonState(currentIndex: vehicleIndex, arr: person.vehicleURLs, buttonType: .Previous)
        nextButton.isEnabled        =  getButtonState(currentIndex: vehicleIndex, arr: person.vehicleURLs, buttonType: .Next)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        vehicleIndex += 1
        previousButton.isEnabled    =  getButtonState(currentIndex: vehicleIndex, arr: person.vehicleURLs, buttonType: .Previous)
        nextButton.isEnabled        =  getButtonState(currentIndex: vehicleIndex, arr: person.vehicleURLs, buttonType: .Next)
    }
    
    func updateView(for vehicle: Vehicle) {
        nameLabel.text          = vehicle.name
        manufactuerLabel.text   = vehicle.manufacturer
        maxSpeedLabel.text      = vehicle.maxAtmospheringSpeed
        modelLabel.text         = vehicle.model
        passengersLabel.text    = vehicle.passengers
        vehicleClass.text       = vehicle.vehicleClass
    }
}
