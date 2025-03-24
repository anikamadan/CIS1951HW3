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
import CoreMotion

// not sure if we should include a "Did Update Locations" method or not?
// not sure how to request location permissions + handle the case where the user has already approved our request +
// set up a purpose string
@Observable class GameViewModel: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let motionManager = CMMotionManager()
    let feedbackGenerator = UINotificationFeedbackGenerator()
    
    var isRequestingLocation = false
    var diningHallModel: DiningHallModel
    
    override init() {
        diningHallModel = DiningHallModel()
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    // method that requests location
    func requestLocation() {
        if !isRequestingLocation {
            isRequestingLocation = true
            locationManager.requestLocation()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            requestLocation()
        case .denied, .restricted:
            print("Not authorized to get location.")
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        isRequestingLocation = false
        print("Failed to get location: \(error)")
    }
    
    // method that checks if we are within 50 meters of any dining hall
    func checkDistanceFromAnyHall(currentLocation: CLLocation) {
        for index in 0..<diningHallModel.diningHalls.count {
            var diningHall = diningHallModel.diningHalls[index]
            let diningHallLocation = CLLocation(latitude: diningHall.location.latitude, longitude: diningHall.location.longitude)
            let distance = currentLocation.distance(from: diningHallLocation)
            if distance <= 50 && !diningHall.isCollected {
                diningHall.completeHall()
                diningHallModel.collectedHalls.append(diningHall)
            }
        }
    }
 //    func locationManager (
 //        _ manager: CLLocationManager,
 //        didVisit visit: CLVisit
 //        ) {
 //
 //        }

}
