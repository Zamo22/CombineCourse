//
//  Constants.swift
//  WeatherApp
//
//  Created by Zaheer Moola on 2021/07/06.
//

import Foundation

struct Constants {
    struct URL {
        static func weather(using city: String) -> String {
            "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=0bfd9c5cc36733700fcb9101b9fd4596&units=metric"
        }
    }
}
