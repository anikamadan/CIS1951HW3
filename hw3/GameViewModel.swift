//
//  GameViewModel.swift
//  hw3
//
//  Created by Sophie Xu on 3/22/25.
//

import Foundation
import SwiftUI
import Observation
import CoreLocation

@Observable class GameViewModel: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Properties
    var diningHallModel: DiningHallModel
    
    let locationManager = CLLocationManager()
    
    override init() {
        diningHallModel = DiningHallModel()
        super.init()
        
        // Set up the location manager
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation() // Request current location
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else { return }
        
        checkDistanceToDiningHalls(currentLocation: currentLocation)
    }
    
    // Delegate method to handle location errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
    
    // check if you are within 50 meters of any dining hall
    func checkDistanceToDiningHalls(currentLocation: CLLocation) {
        for index in 0..<diningHallModel.diningHalls.count {
            var diningHall = diningHallModel.diningHalls[index]
            let diningHallLocation = CLLocation(latitude: diningHall.location.latitude, longitude: diningHall.location.longitude)
            let distance = currentLocation.distance(from: diningHallLocation)
            
            // If within 50 meters, allow collection
            if distance <= 50 && !diningHall.isCollected {
                diningHall.completeHall()
                diningHallModel.diningHalls[index] = diningHall
                print("\(diningHall.name) has been collected!")
            }
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        for index in 0..<diningHallModel.diningHalls.count {
            var diningHall = diningHallModel.diningHalls[index]
            
            let diningHallLocation = CLLocation(latitude: diningHall.location.latitude, longitude: diningHall.location.longitude)
            let visitLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
            
            let distance = visitLocation.distance(from: diningHallLocation)
            
            if distance <= 50 && !diningHall.isCollected {
                diningHall.completeHall()
                diningHallModel.diningHalls[index] = diningHall
                print("\(diningHall.name) has been collected upon visit!")
            }
        }
    }

}
