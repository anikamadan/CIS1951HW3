//
//  DiningHallModel.swift
//  hw3
//
//  Created by Anika Madan on 3/18/25.
//

//
//  QuizViewModel.swift
//  hw2
//
//  Created by Anika Madan on 3/1/25.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class DiningHallModel {
    // MARK: - Properties
    var diningHalls: [DiningHall] = [] // dictionary to store questions
    var currentDiningHall: String = "" // name of the current question
    
    
    // MARK: - Initialization
    init() {
        loadDiningHalls() // Call to load questions into the array
    }
    
    // MARK: - Methods
    
    /// Initializes questions array with data.
    func loadDiningHalls() {
        // Hard-coded questions with local images
//        self.diningHalls = [
//            "commons": DiningHall(name: "1920 Commons", location: CLLocationCoordinate2D.commons),
//            "accenture": DiningHall(name: "Accenture Cafe", location: CLLocationCoordinate2D.accenture),
//            "falk": DiningHall(name: "Falk Kosher", location: CLLocationCoordinate2D.falk),
//            "hill": DiningHall(name: "Hill", location: CLLocationCoordinate2D.hill),
//            "houston": DiningHall(name: "Houston", location: CLLocationCoordinate2D.houston),
//            "joes": DiningHall(name: "Joe's Cafe", location: CLLocationCoordinate2D.joes),
//            "kceh": DiningHall(name: "Kings Court English House", location: CLLocationCoordinate2D.kceh),
//            "lauder": DiningHall(name: "Lauder", location: CLLocationCoordinate2D.lauder),
//            "mcclelland": DiningHall(name: "McLelland", location: CLLocationCoordinate2D.mcclelland),
//            "pret": DiningHall(name: "Pret", location: CLLocationCoordinate2D.pret),
//            "quaker": DiningHall(name: "Quaker Kitchen", location: CLLocationCoordinate2D.quaker)
//            
//        ]
        
        self.diningHalls = [
            DiningHall(name: "1920 Commons", location: CLLocationCoordinate2D.commons),
            DiningHall(name: "Accenture Cafe", location: CLLocationCoordinate2D.accenture),
            DiningHall(name: "Falk Kosher", location: CLLocationCoordinate2D.falk),
            DiningHall(name: "Hill", location: CLLocationCoordinate2D.hill),
            DiningHall(name: "Houston", location: CLLocationCoordinate2D.houston),
            DiningHall(name: "Joe's Cafe", location: CLLocationCoordinate2D.joes),
            DiningHall(name: "Kings Court English House", location: CLLocationCoordinate2D.kceh),
            DiningHall(name: "Lauder", location: CLLocationCoordinate2D.lauder),
            DiningHall(name: "McLelland", location: CLLocationCoordinate2D.mcclelland),
            DiningHall(name: "Pret", location: CLLocationCoordinate2D.pret),
            DiningHall(name: "Quaker Kitchen", location: CLLocationCoordinate2D.quaker)
            
        ]
        
    }
    /// Processes the selected answer, updates the score and advances to the next question.
    func isCompleted(hall: DiningHall) -> Bool {
        return hall.isCollected
    }
    
    
}
