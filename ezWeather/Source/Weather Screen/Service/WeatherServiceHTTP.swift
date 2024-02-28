//
//  WeatherServiceHTTP.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import Foundation

class WeatherServiceHTTP: WeatherService {
    
    // MARK: - Properties
    private let decoder = JSONDecoder()
    
    // MARK: - Function
    func fetchWeather(
        success: @escaping FetchSuccess,
        failure: @escaping FetchFailure
    ) {
        
        guard
            let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=-23.4628&longitude=-46.5333&current=temperature_2m,is_day,weather_code&timezone=auto")
        else {
            failure(InvalidURL())
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            guard let data = data else {
                failure(InvalidResponseError())
                return
            }
            
            do {
                
                let weatherData = try self.decoder.decode(
                    WeatherResponse.self,
                    from: data
                )
                
                let weatherTemperature = Weather(
                    currentTemperature: weatherData.current.temperature2M, 
                    currentStatusCode: weatherData.current.weatherCode
                )
                
                success(weatherTemperature)
            } catch {
                failure(DecodeError())
                return
            }
        }.resume()
    }
}

// MARK: - Errors
struct  InvalidResponseError: LocalizedError {
    var errorDescription: String? = "Invalid response"
}

struct InvalidParseError: LocalizedError {
    var errorDescription: String? = "Invalid Parse"
}

struct DecodeError: LocalizedError {
    var errorDescription: String? = "Can't decode"
}

struct InvalidURL: LocalizedError {
    var errorDescription: String? = "Invalide URL"
}
