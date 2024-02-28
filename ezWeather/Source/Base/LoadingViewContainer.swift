//
//  LoadingViewContainer.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 27/02/24.
//

import UIKit

class LoadingViewContainer: UIView {
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Views
    lazy var spinner: UIActivityIndicatorView = {
        var spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    // MARK: - Functions
    func setup() {
        backgroundColor = .background
        setupSpinner()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupSpinner() {
        addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func stop() {
        removeFromSuperview()
    }
    
    static func start(in view: UIView) -> LoadingViewContainer {
        let loadingView = LoadingViewContainer()
        view.addSubview(loadingView)
        view.addConstraints([
            loadingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.rightAnchor.constraint(equalTo: view.rightAnchor),
            loadingView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        return loadingView
    }
}

private var loadingViewKey: UInt8 = 0
extension UIViewController {
    var loadingViewContainer: LoadingViewContainer? {
        get { return objc_getAssociatedObject(self, &loadingViewKey) as? LoadingViewContainer }
        set { objc_setAssociatedObject(self, &loadingViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func startFullScreenLoading() {
        loadingViewContainer = LoadingViewContainer.start(in: view)
    }
    
    func stopFullScreenLoading() {
        loadingViewContainer?.stop()
    }
}
