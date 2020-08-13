//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 8/13/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

extension Double {
    
    func toFahrenheit() -> Double {
        // current temperature is always in Kelvin
        let temperature = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        // convert to fahrenheit from Kelvin
        let convertedTemperature = temperature.converted(to: .fahrenheit)
        return convertedTemperature.value
    }
    
    func toCelsius() -> Double {
        // current temperature is always in Kelvin
        let temperature = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        // convert to fahrenheit from Kelvin
        let convertedTemperature = temperature.converted(to: .celsius)
        return convertedTemperature.value
    }
}
