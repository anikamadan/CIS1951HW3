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
import Observation

@Observable class DiningHallModel {
    // MARK: - Properties
    var diningHalls: [DiningHall] = [] // dictionary to store all the collected dining halls
    var currentDiningHall: String = "" // name of the current dining hall
    
    // MARK: - Initialization
    init() {
        loadDiningHalls() // Call to load questions into the array
    }
    
    // MARK: - Methods
    
    /// Initializes questions array with data.
    func loadDiningHalls() {
        
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
    
    
}
