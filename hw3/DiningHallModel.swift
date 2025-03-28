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
    var diningHalls: [DiningHall] = [] // dictionary to store all the dining halls
    var currentDiningHall: String = "" // name of the current dining hall
    var collectedHalls: [DiningHall] = [] // dictionary to store all the collected dining halls
    var collectedStates: [GameState] = []
    
    // MARK: - Initialization
    init() {
        loadDiningHalls() // Call to load questions into the array
    }
    
    // MARK: - Methods
    
    /// Initializes questions array with data.
    func loadDiningHalls() {
        
        self.diningHalls = [
            DiningHall(name: "1920 Commons", location: CLLocationCoordinate2D.commons, state: .commons, index: 0),
            DiningHall(name: "Accenture Cafe", location: CLLocationCoordinate2D.accenture, state: .accenture, index: 1),
            DiningHall(name: "Falk Kosher", location: CLLocationCoordinate2D.falk, state: .falk, index: 2),
            DiningHall(name: "Hill", location: CLLocationCoordinate2D.hill, state: .hill, index: 3),
            DiningHall(name: "Houston", location: CLLocationCoordinate2D.houston, state: .houston, index: 4),
            DiningHall(name: "Joe's Cafe", location: CLLocationCoordinate2D.joes, state: .joes, index: 5),
            DiningHall(name: "Kings Court English House", location: CLLocationCoordinate2D.kceh, state: .kceh, index: 6),
            DiningHall(name: "Lauder", location: CLLocationCoordinate2D.lauder, state: .lauder, index: 7),
            DiningHall(name: "McLelland", location: CLLocationCoordinate2D.mcclelland, state: .mclelland, index: 8),
            DiningHall(name: "Pret", location: CLLocationCoordinate2D.pret, state: .pret, index: 9),
            DiningHall(name: "Quaker Kitchen", location: CLLocationCoordinate2D.quaker, state: .quaker, index: 10)
            
        ]
        
    }
    
    
}
