//
//  WeatherService.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import Foundation

protocol WeatherService {
    typealias FetchSuccess = ((Weather) -> Void)
    typealias FetchFailure = ((Error) -> Void)
    
    func fetchWeather(
        success: @escaping FetchSuccess,
        failure: @escaping FetchFailure
    )
}
