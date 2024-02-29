//
//  FindLocationCoordinator.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 28/02/24.
//

import UIKit

class FindLocationCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    let viewModel: FindLocationViewModel
    let locationManager = LocationManager()
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        viewModel = FindLocationViewModel(locationManager: locationManager, navigationController: navigationController)
    }
    
    // MARK: - Starts
    func start() {
        let viewController = FindLocationViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
