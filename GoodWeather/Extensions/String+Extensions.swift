//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 8/12/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

extension String {
    
    func escaped() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    
}
