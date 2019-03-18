//
//  ViewController.swift
//  Clima
//
//  Created by murad on 16/03/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "f79c491d3dd1092c0eb1dc71cfc66f8e"
    
    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TODO: Set up the location manager here
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    //MARK: - Location Manager Delegate Methods
    
    //Activated when location manager will receive location data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            print("Longtitude = \(location.coordinate.longitude). Latitude = \(location.coordinate.latitude)")
            
        }
    }
    
    //Activated if location manager don't receive location data
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location unavailable"
    }

}

