//
//  Bindable.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import Foundation

class Bindable<T> {
    typealias Listener = (T) -> Void
    
    // MARK: - Properties
    var listeners: [Listener] = []
    
    // MARK: - Initializer
    init(_ v: T) {
        value = v
    }
    
    // MARK: - Bind
    func bind(_ listener: @escaping Listener) {
        self.listeners.append(listener)
    }
    
    // MARK: - Trigger
    var value: T {
        didSet { listeners.forEach { $0(value) } }
    }
}
