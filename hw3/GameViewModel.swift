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
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        isRequestingLocation = false
        print("Failed to get location: \(error)")
    }
    
 //    func locationManager (
 //        _ manager: CLLocationManager,
 //        didVisit visit: CLVisit
 //        ) {
 //
 //        }

}
