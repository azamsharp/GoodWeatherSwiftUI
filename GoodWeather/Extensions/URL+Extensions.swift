//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 8/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL {
    
    static func urlForWeatherFor(_ city: String) -> URL? {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=YOURAPIKEY") else {
            return nil
        }
        
        return url
        
    }
    
}
