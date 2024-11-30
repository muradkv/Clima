//
//  ViewController.swift
//  Clima
//
//  Created by murad on 18.10.2024.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    //MARK: - Properties
    
    private let weatherView = WeatherView()
    private var weatherManager = WeatherManager()
    private let locationManager = CLLocationManager()

    //MARK: - Life cycle
    
    override func loadView() {
        view = weatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    //MARK: - Methods
    
    private func setDelegates() {
        weatherView.delegate = self
        weatherView.setTextFieldDelegate(self)
        weatherManager.delegate = self
        locationManager.delegate = self
    }
}

//MARK: - WeatherViewDelegate

extension WeatherViewController: WeatherViewDelegate {
    func didSearchButtonTapped(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        textField.endEditing(true)
    }
    
    func didLocationButtonTapped(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
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
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.weatherView.updateUI(with: weather)
        }
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.featchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
}
