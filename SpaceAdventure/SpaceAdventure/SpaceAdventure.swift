//
//  SpaceAdventure.swift
//  SpaceAdventure
//
//  Created by Student on 4/27/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import Darwin

class SpaceAdventure {
    
    let planetarySystem: PlanetarySystem
    
    init(planetarySystem: PlanetarySystem) {
        self.planetarySystem = planetarySystem
    }
    
    
    private func displayIntroduction(){
       
        let diameterOfEarth: Float = 24859.82 // In miles, from pole to pole.
        
        print("Welcome the \(planetarySystem.name)!")
        print("There are \(planetarySystem.planets.count) planets to explore.")
        print("You are currently on Earth, which has a circumference of \(diameterOfEarth) miles.")
    }
    
    private func responseToPrompt(prompt: String) -> String {
        print(prompt)
        return readLine()!
    }
    
    
    private func greetAdventurer(){
        
        let name = responseToPrompt(prompt: "What is your name?")
        print("Nice to meet you, \(name). My name is Eliza, I'm an old friend of Siri.")
    }
    
    
    private func determineDestination() {
        print("Let's go on an adventure!")
        print("Shall I randomly choose a planet for you to visit? (Y or N)(Q to quit)")
        
        var decision = "" // Start with empty String
        while !(decision == "Y" || decision == "N" || decision == "Q") {
            decision = readLine()!
            if decision.uppercased() == "Y" {
                if let planet = planetarySystem.randomPlanet {
                    visit(planetName: planet.name)
                } else {
                    print("Sorry, but there are no planets in this system.")
                }
            } else if decision.uppercased() == "N" {
                let planetName = responseToPrompt(prompt: "Ok, name the planet you would like to visit.")
                    visit(planetName: planetName)
            } else if decision.uppercased() == "Q" {
                endAdventure()
                break
            }
            else {
                print("Sorry, I didn't get that.")
            }
        }
    }
    
    func start() {
        displayIntroduction()
        greetAdventurer()
        if (!planetarySystem.planets.isEmpty) {
            determineDestination()
        }
    }
    
    private func visit(planetName: String) {
        print("Traveling to \(planetName)...")
        for planet in planetarySystem.planets {
            if planetName.lowercased() == planet.name.lowercased() {
                print("Arrived at \(planet.name). \(planet.description)")
            }
        }
        print(" ")›
        determineDestination()
    }
    
    private func endAdventure() {
        print("It was fun! Until next time!")
        exit(0)
    }
}
