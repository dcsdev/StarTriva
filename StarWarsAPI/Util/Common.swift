//
//  Common.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/23/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import Foundation


let SWAPI_BASE_URL = "https://swapi.co/api/"

public enum ButtonType {
    case Previous
    case Next
}

func getButtonState(currentIndex: Int, arr: [String], buttonType: ButtonType )->Bool {
    
    //If there is only a single element in the array, we do not need to show a previous or a next button
    if arr.count == 1 {
        return false
    }
    
    
    if buttonType == .Next {
        if (arr.count > 1 && currentIndex != arr.count - 1) {
            return true
        }
    } else {
        
        if currentIndex == arr.count {
            return false
        }
        
        if currentIndex == 0 {
            return false
        }
        
        if currentIndex > 0 {
            return true
        }
    }
    
    return false
}
