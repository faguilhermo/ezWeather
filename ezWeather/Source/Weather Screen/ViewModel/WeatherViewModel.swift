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

enum WeatherStatus: String {
    case clearSky
    case partlyCloudy
    case cloudy
    case rainy
    case snow
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
    func getWeatherStatus(with code: Int) -> (WeatherStatus, String) {
        switch code {
        case 0:
            return (.clearSky, "céu limpo")
        case 1...3:
            return (.partlyCloudy, "pouco nublado")
        case 45...48:
            return (.cloudy, "nublado")
        case 51...67, 80...82, 95...99:
            return (.rainy, "chuvoso")
        case 71...77, 85...86:
            return (.snow, "neve")
        default:
            return (.clearSky, "céu limpo")
        }
    }
    
    func convert(currentWeather: Double) -> String {
        let currentWeatherRounded = Int(currentWeather)
        let currentWeatherString = String(currentWeatherRounded)
        return currentWeatherString
    }
    
    func getWeather() {
        state.value = .loading
        service.fetchWeather { [weak self] weather in
            DispatchQueue.main.async {
                print("temperatura >> \(weather)")
                self?.state.value = .data(weather)
            }
        } failure: { [weak self] error in
            DispatchQueue.main.async {
                self?.state.value = .error
            }
        }
    }
}
