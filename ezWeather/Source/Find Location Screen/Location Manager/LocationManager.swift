//
//  LocationManager.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 28/02/24.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Properties
    let manager = CLLocationManager()
    var completion: ((CLLocation) -> Void)?
    
    // MARK: - Functions
    func getUserLocation(completion: @escaping ((CLLocation) -> Void)) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        completion?(location)
        manager.stopUpdatingLocation()
    }
}
