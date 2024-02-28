//
//  ErrorViewContainer.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 27/02/24.
//

import UIKit

class ErrorViewContainer: UIView {
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Functions
    func setup() {
        backgroundColor = .yellow
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func stop() {
        removeFromSuperview()
    }
    
    static func start(in view: UIView) -> ErrorViewContainer {
        let errorView = ErrorViewContainer()
        view.addSubview(errorView)
        view.addConstraints([
            errorView.leftAnchor.constraint(equalTo: view.leftAnchor),
            errorView.topAnchor.constraint(equalTo: view.topAnchor),
            errorView.rightAnchor.constraint(equalTo: view.rightAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return errorView
    }
}

private var errorViewKey: UInt8 = 0
extension UIViewController {
    var errorViewContainer: ErrorViewContainer? {
        get { return objc_getAssociatedObject(self, &errorViewKey) as? ErrorViewContainer }
        set { objc_setAssociatedObject(self, &errorViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    func startFullScreenError() {
        errorViewContainer =  ErrorViewContainer.start(in: view)
    }
    
    func stopFullScreenError() {
        errorViewContainer?.stop()
    }
}
