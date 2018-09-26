//
//  FilmVC.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/20/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import UIKit

class FilmVC: UIViewController, PersonProtocol {
    
    //MARK: - Local Variables
    var person: Person!
    var filmIndex = 0
    var nrm: NetworkRequestManager = NetworkRequestManager();
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel       : UILabel!
    @IBOutlet weak var producerLabel    : UILabel!
    @IBOutlet weak var releaseDateLabel : UILabel!
    @IBOutlet weak var directorLabel    : UILabel!
    //@IBOutlet weak var swipeView      : UIView!
    @IBOutlet weak var nextButton       : UIButton!
    @IBOutlet weak var previousButton   : UIButton!
    @IBOutlet weak var crawlTextView: BlackBGTextView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previousButton.isEnabled    = false
        nextButton.isEnabled        = person.filmURLs.count > 1
        
        nrm.getGeneric(forEndpoint: SWAPI.staticURL(url: person.filmURLs[0])) { (passedFilm: Film?, passedError: Error?) in
            //self.setupView(for: film)
        }
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navbarbackground")?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        crawlTextView.scrollToBotom()
    }
    
    //MARK: - View
    func updateView(for film: Film) {
        titleLabel.text         = film.title
        producerLabel.text      = film.producer
        releaseDateLabel.text   = film.releaseDate
        directorLabel.text      = film.director
        crawlTextView.text      = film.openingCrwal
    }
    
    //MARK: - IBActions
    fileprivate func GetFilm() {
        nrm.getGeneric(forEndpoint: SWAPI.staticURL(url: person.filmURLs[filmIndex])) { (passedFilm: Film?, passedError: Error?) in
            
            if let film = passedFilm {
                self.updateView(for: film)
            } else {
                if let error = passedError {
                    debugPrint(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func previousBtnPressed(_ sender: Any) {
        filmIndex -= 1
        GetFilm()
        previousButton.isEnabled    =  getButtonState(currentIndex: filmIndex, arr: person.filmURLs, buttonType: .Previous)
        nextButton.isEnabled        =  getButtonState(currentIndex: filmIndex, arr: person.filmURLs, buttonType: .Next)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        filmIndex += 1
        
        GetFilm()
        
        previousButton.isEnabled    =  getButtonState(currentIndex: filmIndex, arr: person.filmURLs, buttonType: .Previous)
        nextButton.isEnabled        =  getButtonState(currentIndex: filmIndex, arr: person.filmURLs, buttonType: .Next)
    }
}

//MARK: - Extensions
extension UITextView {
    
    func scrollToBotom() {
        let range = NSMakeRange(text.characters.count - 1, 1);
        scrollRangeToVisible(range);
    }
}

