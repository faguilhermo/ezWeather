//
//  FindLocationViewController.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 28/02/24.
//

import UIKit

class FindLocationViewController: UIViewController {
    // MARK: - Properties
    private let viewModel: FindLocationViewModel
    private var customView: FindLocationView?
    
    // MARK: - Initializers
    init(viewModel: FindLocationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        customView = FindLocationView(viewModel: viewModel)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.showLocationScreen()
    }
    
    // MARK: - ViewModel Bind
    private func bindViewModel() {
        viewModel.state.bind { [weak self] state in
            guard let state = state else { return }
            switch state {
            case .loading:
                self?.showLoading(true)
            case .data:
                self?.customView?.set()
                self?.showLoading(false)
            case .error:
                self?.showError(true)
                self?.showLoading(false)
            }
        }
    }
    
    private func showLoading(_ isLoading: Bool) {
        isLoading ? startFullScreenLoading() : stopFullScreenLoading()
    }
    
    private func showError(_ isResponseInvalid: Bool) {
        isResponseInvalid ? startFullScreenError() : stopFullScreenError()
        showLoading(false)
    }
}
