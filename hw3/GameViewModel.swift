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
    /// The current state of the game. See ``GameState`` for a list of possible values.
    private(set) var state = GameState.loading
    private(set) var locState = LocationState.tooFar
    
    /// A list of restaurants to rotate between. Populated by the ``fetchPlaces(search:)`` method.
    
    let locationManager = CLLocationManager()
    let motionManager = CMMotionManager()
    let feedbackGenerator = UINotificationFeedbackGenerator()
    
    var isRequestingLocation = false
    var diningHallModel: DiningHallModel
    
    override init() {
        diningHallModel = DiningHallModel()
        super.init()
        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
    }
    
    /// Starts loading the game by requesting location access, or requesting the location itself if access has
    /// already been granted.
    func loadGame() {
        locState = .tooFar
        state = .loading
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            requestLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
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
            state = .error
        default:
            break
        }
    }

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        isRequestingLocation = false
        print("Failed to get location: \(error)")
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
    
        isRequestingLocation = false
        startGame()
}
    
    // update state
    // method that checks if we are within 50 meters of any dining hall
    func checkDistanceFromAnyHall(currentLocation: CLLocation, index: Int) {
        var diningHall = diningHallModel.diningHalls[index]
        let diningHallLocation = CLLocation(latitude: diningHall.location.latitude, longitude: diningHall.location.longitude)
        let distance = currentLocation.distance(from: diningHallLocation)
        if distance <= 50 && !diningHall.isCollected {
            locState = .closeEnough
        } else{
            locState = .tooFar
        }
    }
    
    /// Starts the game itself by setting the state to ready and starting motion updates.
    func startGame() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 1 / 50
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
                if let self {
                    if let motion {
                        handleMotion(motion)
                    } else if let error {
                        print("Failed to receive motion update: \(error)")
                        state = .error
                        motionManager.stopDeviceMotionUpdates()
                    }
                }
            }
            
            state = .home
        } else {
            print("Device motion is not available!")
            state = .error
        }
    }
    
    func checkComplete(index: Int) -> Bool {
        return diningHallModel.diningHalls[index].isCollected
    }
    
    func determinHallState(index: Int){
        guard let currentLocation = locationManager.location else {
                print("Current location is not available")
                return
            }
        if (diningHallModel.diningHalls[index].isCollected){
            state = .completed
        }
        else{
            checkDistanceFromAnyHall(currentLocation: currentLocation, index: index)
        }
    }
    
    func changeHall(index: Int){
//        guard let currentLocation = locationManager.location else {
//                print("Current location is not available")
//                return
//            }
        
        switch index {
        case 0:
            state = .commons
            determinHallState(index: 0)
        case 1:
            state = .accenture
            determinHallState(index: 1)
        case 2:
            state = .falk
            determinHallState(index: 2)
        case 3:
            state = .hill
            determinHallState(index: 3)
        case 4:
            state = .houston
            determinHallState(index: 4)
        case 5:
            state = .joes
            determinHallState(index: 5)
        case 6:
            state = .kceh
            determinHallState(index: 6)
        case 7:
            state = .lauder
            determinHallState(index: 7)
        case 8:
            state = .mclelland
            determinHallState(index: 8)
        case 9:
            state = .pret
            determinHallState(index: 9)
        case 10:
            state = .quaker
            determinHallState(index: 10)
        default:
            state = .home
        }
    }
    

    // no api says if the device is shaking or not
    // if the user properly shakes their device at any time, we will perform a check of whether they
    // can collect any dining halls within 50 meters
    
    func handleMotion(_ motion: CMDeviceMotion) {
        let correctThreshold = Double.pi * 1
        let incorrectThreshold = Double.pi * 0.65
        let absoluteRoll = abs(motion.attitude.roll)
        
        switch state {

        case .commons, .accenture, .falk, .hill, .houston, .joes, .kceh, .lauder, .mclelland, .pret, .quaker:
            switch locState{
            case .closeEnough:
                if absoluteRoll > correctThreshold{
                    completeCurrHall()
                    state = .completed
                    feedbackGenerator.notificationOccurred(.success)
                    locState = .tooFar
                }
            default:
                break
            }
        default:
            // Do nothing
            break
        }
    }
    
    func completeCurrHall(){
        switch state{
        case .commons:
            diningHallModel.diningHalls[0].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[0])
        case .accenture:
            diningHallModel.diningHalls[1].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[1])
        case .falk:
            diningHallModel.diningHalls[2].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[2])
        case .hill:
            diningHallModel.diningHalls[3].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[3])
        case .houston:
            diningHallModel.diningHalls[4].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[4])
        case .joes:
            diningHallModel.diningHalls[5].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[5])
        case .kceh:
            diningHallModel.diningHalls[6].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[6])
        case .lauder:
            diningHallModel.diningHalls[7].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[7])
        case .mclelland:
            diningHallModel.diningHalls[8].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[8])
        case .pret:
            diningHallModel.diningHalls[9].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[9])
        case .quaker:
            diningHallModel.diningHalls[10].completeHall()
            diningHallModel.collectedHalls.append(diningHallModel.diningHalls[10])
        default:
            break
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

