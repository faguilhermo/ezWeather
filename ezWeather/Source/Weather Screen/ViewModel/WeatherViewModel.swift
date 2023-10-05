//
//  WeatherViewModel.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import UIKit

enum WeatherViewModelState {
    case loading
    case data(Weather)
    case error
}

class WeatherViewModel {
    
    // MARK: - Properties
    var state: Bindable<WeatherViewModelState?> = Bindable(nil)
    var service: WeatherService
    
    // MARK: - Initializer
    init(service: WeatherService) {
        self.service = service
    }
    
    // MARK: - Functions
    func getWeather() {
        state.value = .loading
        service.fetchWeather { [weak self] weather in
            DispatchQueue.main.async {
                self?.state.value = .data(weather)
            }
        } failure: { [weak self] error in
            DispatchQueue.main.async {
                self?.state.value = .error
            }
        }
    }
}
