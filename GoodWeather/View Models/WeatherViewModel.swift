//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 8/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published private var weather: Weather?
    @Published var message: String = ""
    
    var temperature: Double {
        guard let temp = weather?.temp else {
            return 0.0
        }
        return temp
    }
    
    func fetchWeather(city: String) {
        
        guard let city = city.escaped() else {
            fatalError("URL is invalid!")
        }
        
        WeatherService().getWeather(city: city) { result in
            switch result {
                case .success(let weather):
                    DispatchQueue.main.async {
                        self.weather = weather
                    }
                case .failure(_ ):
                    DispatchQueue.main.async {
                        self.message = "Unable to find weather"
                        self.weather = nil
                }
            }
        }
        
    }
    
}
