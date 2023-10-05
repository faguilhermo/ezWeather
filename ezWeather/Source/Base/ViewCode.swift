//
//  ViewCode.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 05/10/23.
//

import Foundation

protocol ViewCode {
    func addViews()
    func addConstraints()
    func setupViews()
    func setupViewCode()
}

extension ViewCode {
    func setupViewCode() {
        addViews()
        addConstraints()
        setupViews()
    }
}
