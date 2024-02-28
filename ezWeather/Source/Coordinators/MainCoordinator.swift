//
//  WeatherCoordinator.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let coordinator = FindLocationCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
