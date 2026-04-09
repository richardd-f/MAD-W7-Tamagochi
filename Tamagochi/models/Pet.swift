//
//  Pet.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//

// Models/Pet.swift
import Foundation
import Observation

@Observable
class Pet {
    var name: String
    var wallet: Int
    var isDead: Bool = false
    var image: String
    
    var fun: Stat
    var cleanliness: Stat
    var hunger: Stat
    var energy: Stat

    
    private var timer: Timer?
    
    init(name: String = "Felix", image: String = "petImage2", wallet: Int = 100) {
        self.name = name
        self.wallet = wallet
        self.image = image
        
        self.fun = Stat(name: "Fun")
        self.cleanliness = Stat(name: "Cleanliness")
        self.hunger = Stat(name: "Hunger")
        self.energy = Stat(name: "Energy")
        
        startTimer()
    }
    
    // MARK: - Timer Logic
    func startTimer() {
        // Reduces stats by 5 every 3 seconds
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.drainStats()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func drainStats() {
        guard !isDead else { return }
        
        let drainAmount = 5
        fun.decrease(by: drainAmount)
        cleanliness.decrease(by: drainAmount)
        hunger.decrease(by: drainAmount)
        energy.decrease(by: drainAmount)
        
        checkDeathCondition()
    }
    
    private func checkDeathCondition() {
        // Pet dies if any stat reaches 0 [cite: 45]
        if hunger.currentValue == 0 || energy.currentValue == 0 ||
           cleanliness.currentValue == 0 || fun.currentValue == 0 {
            die()
        }
    }
    
    // MARK: - Actions
    func die() {
        isDead = true
        stopTimer()
    }
    
    func revive() {
        wallet = 0
        fun.currentValue = fun.maxValue / 2
        cleanliness.currentValue = cleanliness.maxValue / 2
        hunger.currentValue = hunger.maxValue / 2
        energy.currentValue = energy.maxValue / 2
        
        isDead = false
        startTimer()
    }
    
    // MARK: - Interactions
    func play() -> [StatChange] {
        let walletGained = Int.random(in: 20...30)
        fun.increase(by: 30)
        wallet += walletGained
        energy.decrease(by: 15)
        cleanliness.decrease(by: 15)
        
        return [
            StatChange(text: "+30 Fun", isPositive: true),
            StatChange(text: "+\(walletGained) Wallet", isPositive: true),
            StatChange(text: "-15 Energy", isPositive: false),
            StatChange(text: "-15 Cleanliness", isPositive: false)
        ]
    }
    
    func clean() -> [StatChange] {
        cleanliness.increase(by: 30)
        fun.decrease(by: 10)
        energy.decrease(by: 10)
        
        return [
            StatChange(text: "+30 Cleanliness", isPositive: true),
            StatChange(text: "-10 Fun", isPositive: false),
            StatChange(text: "-10 Energy", isPositive: false)
        ]
    }
    
    func feed()  -> [StatChange] {
        if wallet >= 5 {
            wallet -= 5 // Costs $5 per press
            hunger.increase(by: 30)
            cleanliness.decrease(by: 10)
        }
        
        return [
            StatChange(text: "+30 Hunger", isPositive: true),
            StatChange(text: "-5 Wallet", isPositive: false),
            StatChange(text: "-10 Cleanliness", isPositive: false)
        ]
    }
    
    func rest() -> [StatChange] {
        energy.increase(by: 30)
        fun.decrease(by: 10)
        hunger.decrease(by: 10)
        
        return [
            StatChange(text: "+30 Energy", isPositive: true),
            StatChange(text: "-10 Fun", isPositive: false),
            StatChange(text: "-10 Hunger", isPositive: false)
        ]
    }
}
