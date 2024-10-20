//
//  ViewController.swift
//  Clima
//
//  Created by murad on 18.10.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    
    private let weatherView = WeatherView()

    //MARK: - Life cycle
    
    override func loadView() {
        view = weatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.delegate = self
        weatherView.setTextFieldDelegate(self)
    }

}

//MARK: - Delegation 

extension WeatherViewController: WeatherViewDelegate, UITextFieldDelegate {
    func didSearchButtonTapped(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        weatherView.updateUI()
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
        
        weatherView.updateUI()
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

