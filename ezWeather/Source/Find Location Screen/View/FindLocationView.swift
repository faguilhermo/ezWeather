//
//  FindLocationView.swift
//  ezWeather
//
//  Created by Fabrício Guilhermo on 28/02/24.
//

import UIKit

class FindLocationView: UIView {
    
    // MARK: - Properties
    private let viewModel: FindLocationViewModel
    
    // MARK: - Initializers
    init(viewModel: FindLocationViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    lazy var locationQuestionStack: UIStackView = {
        var locationQuestionStack = UIStackView()
        locationQuestionStack.axis = .vertical
        locationQuestionStack.translatesAutoresizingMaskIntoConstraints = false
        return locationQuestionStack
    }()
    
    lazy var locationQuestionTitle: UILabel = {
        var locationQuestionTitle = UILabel()
        locationQuestionTitle.textAlignment = .center
        locationQuestionTitle.text = "ONDE VOCÊ ESTÁ?"
        locationQuestionTitle.font = UIFont(name: "Sturkopf", size: 40)
        locationQuestionTitle.translatesAutoresizingMaskIntoConstraints = false
        return locationQuestionTitle
    }()
    
    lazy var locationQuestion: UILabel = {
        var locationQuestion = UILabel()
        locationQuestion.numberOfLines = 0
        locationQuestion.textAlignment = .center
        locationQuestion.text = "UTILIZAMOS SUA LOCALIZAÇÃO PARA UMA PREVISÃO DO TEMPO MAIS PRECISA"
        locationQuestion.font = UIFont(name: "RobotoCondensed-Regular", size: 20)
        locationQuestion.translatesAutoresizingMaskIntoConstraints = false
        return locationQuestion
    }()
    
    lazy var getLocationAccessButton: UIButton = {
        var getLocationAccessButton = UIButton()
        getLocationAccessButton.layer.cornerRadius = 0.5 * 140
        getLocationAccessButton.clipsToBounds = true
        getLocationAccessButton.layer.borderWidth = 2
        getLocationAccessButton.layer.borderColor = UIColor.black.cgColor
        getLocationAccessButton.setTitle("LOCALIZAR", for: .normal)
        getLocationAccessButton.setTitleColor(.black, for: .normal)
        getLocationAccessButton.addTarget(self, action: #selector(getLocationAccessButtonPressed), for: .touchUpInside)
        getLocationAccessButton.translatesAutoresizingMaskIntoConstraints = false
        return getLocationAccessButton
    }()
    
    @objc func getLocationAccessButtonPressed() {
        print("pegar localização")
    }
    
    // MARK: - Setters
    func set() {
        backgroundColor = .background
    }
}

extension FindLocationView: ViewCode {
    func addViews() {
        addSubview(locationQuestionStack)
        locationQuestionStack.addArrangedSubview(locationQuestionTitle)
        locationQuestionStack.addArrangedSubview(locationQuestion)
        addSubview(getLocationAccessButton)
    }
    
    func addConstraints() {
        addLocationQuestionStackConstraint()
        addGetLocationAccessButtonConstraint()
    }
    
    func addLocationQuestionStackConstraint() {
        locationQuestionStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        locationQuestionStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        locationQuestionStack.widthAnchor.constraint(equalToConstant: 280).isActive = true
    }
    
    func addGetLocationAccessButtonConstraint() {
        getLocationAccessButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        getLocationAccessButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        getLocationAccessButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        getLocationAccessButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
}
