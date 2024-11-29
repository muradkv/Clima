//
//  ViewController.swift
//  Clima
//
//  Created by murad on 18.10.2024.
//

import UIKit

class WeatherViewController: UIViewController, WeatherManagerDelegate {

    //MARK: - Properties
    
    private let weatherView = WeatherView()
    private var weatherManager = WeatherManager()

    //MARK: - Life cycle
    
    override func loadView() {
        view = weatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.delegate = self
        weatherView.setTextFieldDelegate(self)
        weatherManager.delegate = self
    }

}

//MARK: - Delegation 

extension WeatherViewController: WeatherViewDelegate, UITextFieldDelegate {
    func didSearchButtonTapped(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        textField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false 
        }
        
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        weatherManager.featchWeather(cityName: text.lowercased())
        
        textField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.weatherView.updateUI(with: weather)
        }
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
}

