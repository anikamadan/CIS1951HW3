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
    
    init( name: String, location: CLLocationCoordinate2D) {
        self.id = UUID() // set id to random id
        self.name = name
        self.location = location
        isCollected = false
    }
    
    mutating func completeHall() {
            self.isCollected = true
    }
    
    
}
