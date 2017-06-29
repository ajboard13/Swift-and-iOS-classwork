//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by Student on 5/4/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation


class UnitConverter {
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        return Int(1.8 * Float(degreesCelsius) + 32.0)
    }
    
}
