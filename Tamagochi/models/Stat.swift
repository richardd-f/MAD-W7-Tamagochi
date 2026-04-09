//
//  Stat.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//
import Foundation
import Observation

@Observable
class Stat {
    var name: String
    var currentValue: Int
    var maxValue: Int
    
    // Default Max Stat is 150
    init(name: String, currentValue: Int = 150, maxValue: Int = 150) {
        self.name = name
        self.currentValue = currentValue
        self.maxValue = maxValue
    }
    
    func increase(by amount: Int) {
        currentValue = min(currentValue + amount, maxValue)
    }
    
    func decrease(by amount: Int) {
        currentValue = max(currentValue - amount, 0)
    }
    
    func upgradeMax(by amount: Int) {
        maxValue += amount
    }
}
