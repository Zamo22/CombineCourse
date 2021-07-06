//
//  Weather.swift
//  WeatherApp
//
//  Created by Zaheer Moola on 2021/07/06.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Weather
}

struct Weather: Codable {
    let temp: Double?
    let humidity: Double?

    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
}
