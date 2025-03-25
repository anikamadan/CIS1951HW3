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
import MapKit

// not sure if we should include a "Did Update Locations" method or not?
// not sure how to request location permissions + handle the case where the user has already approved our request +
// set up a purpose string

// game state -> which dining hall is being collected ? (switch)
// conditions? -> close enough; shaking device
//
// not collected (false); ready to collect; collected (true)
// enum -> HallState -> three cases
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
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//     if let location = locations.last {
//         send(location, to: )
//     }
//    }
    
    // update state
    // method that checks if we are within 50 meters of any dining hall
    func checkDistanceFromAnyHall(currentLocation: CLLocation) {
        for index in 0..<diningHallModel.diningHalls.count {
            var diningHall = diningHallModel.diningHalls[index]
            let diningHallLocation = CLLocation(latitude: diningHall.location.latitude, longitude: diningHall.location.longitude)
            let distance = currentLocation.distance(from: diningHallLocation)
            if distance <= 50 && !diningHall.isCollected {
                feedbackGenerator.notificationOccurred(.success)
                diningHall.completeHall()
                diningHallModel.collectedHalls.append(diningHall)
            }
        }
    }
    
    func startGame() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 1 / 50
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
                if let self {
                    if let motion {
                        handleMotion(motion)
                    } else if let error {
                        print("Failed to receive motion update: \(error)")
                        motionManager.stopDeviceMotionUpdates()
                    }
                }
            }
        } else {
            print("Device motion is not available!")
        }
    }
    // no api says if the device is shaking or not
    // if the user properly shakes their device at any time, we will perform a check of whether they
    // can collect any dining halls within 50 meters
    func handleMotion(_ motion: CMDeviceMotion) {
        let correctThreshold = Double.pi * 0.35
        let incorrectThreshold = Double.pi * 0.65
        let absoluteRoll = abs(motion.attitude.roll)
        if absoluteRoll < correctThreshold {
            checkDistanceFromAnyHall(currentLocation: CLLocation())
        }
    }
 //    func locationManager (
 //        _ manager: CLLocationManager,
 //        didVisit visit: CLVisit
 //        ) {
 //
 //        }
    // tap on hall -> check if the user is close enough -> enter a collection mode -> check if device is being shaken
    // ->
    // aka view -> location -> enter a collection -> motion
    //

}
