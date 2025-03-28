//
//  DiningHall.swift
//  hw3
//
//  Created by Anika Madan on 3/18/25.
//
import Foundation
import SwiftUI
import CoreLocation

struct DiningHall: Identifiable {
    var id: UUID
    var name: String
    var location: CLLocationCoordinate2D
    var isCollected: Bool
    var state: GameState
    var index: Int
    
    init( name: String, location: CLLocationCoordinate2D, state: GameState, index: Int) {
        self.id = UUID() // set id to random id
        self.name = name
        self.location = location
        self.state = state
        self.index = index
        isCollected = false
    }
    
    mutating func completeHall() {
            self.isCollected = true
    }
    
    
}
