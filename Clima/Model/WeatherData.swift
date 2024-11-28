//
//  WeatherData.swift
//  Clima
//
//  Created by murad on 27.11.2024.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int 
}
