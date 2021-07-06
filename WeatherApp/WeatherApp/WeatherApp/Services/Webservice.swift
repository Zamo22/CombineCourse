//
//  Webservice.swift
//  WeatherApp
//
//  Created by Zaheer Moola on 2021/07/06.
//

import Foundation
import Combine

class Webservice {
    func fetchWeather(for city: String) -> AnyPublisher<Weather, Error> {
        guard let url = URL(string: Constants.URL.weather(using: city)) else {
            fatalError("URL provided is not valid")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .print()
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
