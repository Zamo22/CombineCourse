//
//  ViewController.swift
//  WeatherApp
//
//  Created by Zaheer Moola on 2021/07/06.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityTextField: UITextField!

    private var webservice = Webservice()
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPublishers()
    }

    private func setUpPublishers() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification,
                                                             object: cityTextField)
        cancellable = publisher.compactMap {
            ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
        .flatMap { city in
            return self.webservice.fetchWeather(for: city)
                .catch{ _ in Just(Weather.placeholder)}
                .map {$0.temp}
        }.sink {
            if let weather = $0 {
                self.temperatureLabel.text = "\(weather) ℃"
                return
            }
            self.temperatureLabel.text = ""
        }
    }


}

