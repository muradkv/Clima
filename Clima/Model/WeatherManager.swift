//
//  WeatherManager.swift
//  Clima
//
//  Created by murad on 26.11.2024.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=768152dd707c0cb597b9e02ca0491603&units=metric"
    
    func featchWeather(cityName: String) -> String {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        return urlString
    }
    
    func performRequest(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Bad URL")
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            guard let data else {
                return
            }
            
            if let weather = self.parseJSON(weatherData: data) {
                
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let city = decodedData.name
            let temperature = decodedData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: city, temperature: temperature)
            
            return weather
        } catch {
            print(error)
            return nil
        }
    }
    
    //First example without closure in func
    //let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}
