//
//  WeatherCoordinator.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import UIKit

class WeatherCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let viewModel: WeatherViewModel
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let service = WeatherServiceHTTP()
        self.viewModel = WeatherViewModel(service: service)
    }
    
    func start() {
        let viewController = WeatherViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
