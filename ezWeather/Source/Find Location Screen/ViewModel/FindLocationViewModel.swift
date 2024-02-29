//
//  FindLocationViewModel.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 28/02/24.
//

import UIKit

enum FindLocationViewModelState {
    case loading
    case data
    case error
}

class FindLocationViewModel {
    
    // MARK: - Properties
    var state: Bindable<FindLocationViewModelState?> = Bindable(nil)
    var locationManager: LocationManager
    var navigationController: UINavigationController
    var location: Location?
    
    // MARK: - Initializer
    init(locationManager: LocationManager, navigationController: UINavigationController) {
        self.locationManager = locationManager
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    func showLocationScreen() {
        state.value = .data
    }
    
    func getUserLocation() {
        locationManager.getUserLocation { [weak self] location in
            guard let self = self else { return }
            self.location = Location(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )
            pushWeatherViewCoontroller()
        }
    }
    
    func pushWeatherViewCoontroller() {
        guard let location = location else { return }
        let coordinator = WeatherCoordinator(navigationController: navigationController, location: location)
        coordinator.start()
    }
}
