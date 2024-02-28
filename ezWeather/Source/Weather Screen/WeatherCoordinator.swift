//
//  WeatherCoordinator.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 28/02/24.
//

import UIKit

class WeatherCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    let viewModel: WeatherViewModel
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let service = WeatherServiceHTTP()
        self.viewModel = WeatherViewModel(service: service)
    }
    
    // MARK: - Starts
    func start() {
        let viewController = WeatherViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
