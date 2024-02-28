//
//  FindLocationViewModel.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 28/02/24.
//

import Foundation

enum FindLocationViewModelState {
    case loading
    case data
    case error
}

class FindLocationViewModel {
    
    // MARK: - Properties
    var state: Bindable<FindLocationViewModelState?> = Bindable(nil)
    
    func showLocationScreen() {
        state.value = .data
    }
}
