//
//  WeatherViewController.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import UIKit

class WeatherViewController: UIViewController {
    // MARK: - Properties
    private let viewModel: WeatherViewModel
    private var customView: WeatherView?
    
    // MARK: - Initializers
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        customView = WeatherView(viewModel: viewModel)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getWeather()
    }
    
    // MARK: - ViewModel Bind
    private func bindViewModel() {
        viewModel.state.bind { [weak self] state in
            guard let state = state else { return }
            switch state {
            case .loading:
                self?.showLoading(true)
            case .data(let weather):
                self?.customView?.set(weather: weather)
                self?.showLoading(false)
            case .error:
                self?.showError()
            }
        }
    }
    
    // MARK: - Call state
    private func showLoading(_ isLoading: Bool) {
        // TODO: Implement loading
    }
    
    private func showError() {
        // TODO: Implement error
        showLoading(false)
    }
}
