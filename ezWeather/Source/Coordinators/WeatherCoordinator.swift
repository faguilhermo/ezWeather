//
//  WeatherCoordinator.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import UIKit

class WeatherCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = WeatherViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
