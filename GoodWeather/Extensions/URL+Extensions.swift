//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 8/11/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL {
    
    static func urlForWeather() -> URL? {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=houston&appid=7d2dd8c9c5578b741c7735ad3f0d39ea") else {
            return nil
        }
        
        return url
        
    }
    
}
