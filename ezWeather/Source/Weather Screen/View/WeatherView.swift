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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    func set(weather: Weather) {
        backgroundColor = .yellow
    }
}

// MARK: - View code extension
extension WeatherView: ViewCode {
    func addViews() {
        // TODO: implement views
    }
    
    func addConstraints() {
        // TODO: implement views constraints
    }
    
    func setupViews() {
        // TODO: setupViews
    }
}
