//
//  PlanetarySystem.swift
//  SpaceAdventure
//
//  Created by Student on 4/27/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation

class PlanetarySystem {
    
    var planets: [Planet]
    let name: String
    init(name: String, planets: [Planet]) {
        self.name = name
        self.planets = planets
    }
    
    var randomPlanet: Planet? {
        if planets.isEmpty {
            return nil
        } else {
            let index = Int(arc4random_uniform(UInt32(planets.count)))
            return planets[index]
        }
    }
    
    
}
