//
//  WeatherView.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import UIKit

class WeatherView: UIView {
    
    // MARK: - Properties
    private let viewModel: WeatherViewModel
    
    // MARK: - Initializers
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    lazy var weatherStack: UIStackView = {
        let weatherStack = UIStackView()
        weatherStack.axis = .vertical
        weatherStack.alignment = .center
        weatherStack.translatesAutoresizingMaskIntoConstraints = false
        return weatherStack
    }()
    
    lazy var cityName: UILabel = {
        let cityName = UILabel()
        cityName.text = "GUARULHOS"
        cityName.font = UIFont(name: "RobotoCondensed-Regular", size: 20)
        cityName.translatesAutoresizingMaskIntoConstraints = false
        return cityName
    }()
    
    lazy var weatherImage: UIImageView = {
        let weatherImage = UIImageView()
        weatherImage.image = UIImage(named: "clearSky")
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        return weatherImage
    }()
    
    lazy var weatherTemperature: UILabel = {
        let weatherTemperature = UILabel()
        weatherTemperature.text = "-"
        weatherTemperature.font = UIFont(name: "Sturkopf", size: 420)
        weatherTemperature.textColor = .weatherTemperature
        weatherTemperature.translatesAutoresizingMaskIntoConstraints = false
        return weatherTemperature
    }()
    
    lazy var weatherStatus: UILabel = {
        let weatherStatus = UILabel()
        weatherStatus.text = "ENSOLARADO"
        weatherStatus.font = UIFont(name: "Sturkopf", size: 40)
        weatherStatus.translatesAutoresizingMaskIntoConstraints = false
        return weatherStatus
    }()
    
    lazy var weekWeather: UIView = {
        let weekWeather = UIView()
        weekWeather.backgroundColor = .gray
        weekWeather.layer.cornerRadius = 20
        weekWeather.translatesAutoresizingMaskIntoConstraints = false
        return weekWeather
    }()
    
    lazy var weekWeatherText: UILabel = {
        let weekWeatherText = UILabel()
        weekWeatherText.text = "Em breve previsão semanal"
        weekWeatherText.font = UIFont(name: "RobotoCondensed-Regular", size: 20)
        weekWeatherText.translatesAutoresizingMaskIntoConstraints = false
        return weekWeatherText
    }()
    
    
    
    // MARK: - Function
    func set(weather: Weather) {
        backgroundColor = .background
        
        let currentStatusCode = weather.currentStatusCode
        weatherImage.image = UIImage(named: viewModel.getWeatherStatus(with: currentStatusCode).0.rawValue)
        weatherTemperature.text = viewModel.transform(currentWeather: weather.currentTemperature)
        weatherStatus.text = viewModel.getWeatherStatus(with: currentStatusCode).1.uppercased()
    }
}

// MARK: - View code extension
extension WeatherView: ViewCode {
    func addViews() {
        addSubview(cityName)
        addSubview(weatherStack)
        weatherStack.addArrangedSubview(weatherImage)
        weatherStack.addArrangedSubview(weatherTemperature)
        addSubview(weatherStatus)
        addSubview(weekWeather)
        weekWeather.addSubview(weekWeatherText)
    }
    
    func addConstraints() {
        addCityNameConstraints()
        addWeatherStackConstrains()
        addWeatherTemperatureConstraints()
        addWeatherTemperatureConstraints()
        addWeatherStatusConstraints()
        addWeekWeatherConstraints()
        weekWeatherText.centerXAnchor.constraint(equalTo: weekWeather.centerXAnchor).isActive = true
        weekWeatherText.centerYAnchor.constraint(equalTo: weekWeather.centerYAnchor).isActive = true
    }
    
    func setupViews() {
        // TODO: setupViews
    }
    
    func addCityNameConstraints() {
        NSLayoutConstraint.activate([
            cityName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cityName.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func addWeatherStackConstrains() {
        NSLayoutConstraint.activate([
            weatherStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func addWeatherTemperatureConstraints() {
        weatherTemperature.heightAnchor.constraint(equalToConstant: 308).isActive = true
    }
    
    func addWeatherStatusConstraints() {
        NSLayoutConstraint.activate([
            weatherStatus.bottomAnchor.constraint(equalTo: weekWeather.topAnchor),
            weatherStatus.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func addWeekWeatherConstraints() {
        NSLayoutConstraint.activate([
            weekWeather.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            weekWeather.centerXAnchor.constraint(equalTo: centerXAnchor),
            weekWeather.widthAnchor.constraint(equalToConstant: 277),
            weekWeather.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
