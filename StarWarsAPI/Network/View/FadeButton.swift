//
//  FadeButton.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/20/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import UIKit

class FadeButton: UIButton {
    override var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.5) {
                if self.isEnabled {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.alpha = 1.0
                    })
                } else {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.alpha = 0.4
                    })
                }
            }
        }
    }
}
