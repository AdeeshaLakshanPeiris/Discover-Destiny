//
//  WeatherModel.swift
//  Discover Destiny
//
//  Created by Guest User on 2025-04-23.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
}

struct Weather: Decodable {
    let description: String
    let icon: String
}
