//
//  Coordinator.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import UIKit

public protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
