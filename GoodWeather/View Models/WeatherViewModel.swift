//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 8/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

enum LoadingState {
    case none
    case loading
    case success
    case failed
}

class WeatherViewModel: ObservableObject {
    
    @Published private var weather: Weather?
    @Published var message: String = ""
    @Published var loadingState: LoadingState = .none
    
    var temperature: Double {
        guard let temp = weather?.temp else {
            return 0.0
        }
        return temp
    }
    
    var humidity: Double {
           guard let humidity = weather?.humidity else {
               return 0.0
           }
           return humidity
       }
    
    func fetchWeather(city: String) {
        
        guard let city = city.escaped() else {
            self.message = "City is incorrect!"
            return
        }
        
        WeatherService().getWeather(city: city) { result in
            switch result {
                case .success(let weather):
                    DispatchQueue.main.async {
                        self.weather = weather
                        self.loadingState = .success
                    }
                case .failure(_ ):
                    DispatchQueue.main.async {
                        self.message = "Unable to find weather"
                        self.loadingState = .failed
                }
            }
        }
        
    }
    
}
