//
//  WeatherView.swift
//  Clima
//
//  Created by murad on 19.10.2024.
//

import UIKit

class WeatherView: UIView {
    //MARK: - Properties
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .trailing
        return stackView
    }()
    
    private let horizontalSearchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private let locationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .weather
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        return button
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search for a city"
        textField.textAlignment = .right
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemFill
        textField.autocorrectionType = .no
        textField.textColor = .weather
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .weather
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()
    
    private let conditionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .weather
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "sun.max")
        return imageView
    }()
    
    private let horizontalTemperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private let temperatureNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21"
        label.font = UIFont.systemFont(ofSize: 80, weight: .black)
        label.textAlignment = .right
        label.textColor = .weather
        return label
    }()
    
    private let temperatureSignsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "°C"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textAlignment = .left
        label.textColor = .weather
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "London"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textColor = .weather
        return label
    }()
    
    private let spaceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    private func setupView() {
        addSubview(backgroundImageView)
        addSubview(verticalStackView)
        
        [horizontalSearchStackView, conditionImageView, horizontalTemperatureStackView, cityLabel, spaceView].forEach { view in
            verticalStackView.addArrangedSubview(view)
        }
        
        [locationButton, searchTextField, searchButton].forEach { view in
            horizontalSearchStackView.addArrangedSubview(view)
        }
        
        horizontalTemperatureStackView.addArrangedSubview(temperatureNumberLabel)
        horizontalTemperatureStackView.addArrangedSubview(temperatureSignsLabel)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            horizontalSearchStackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            horizontalSearchStackView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
            conditionImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
}
