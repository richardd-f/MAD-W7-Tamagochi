//
//  ShopView.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//

import SwiftUI

import SwiftUI

struct ShopView: View {
    var pet: Pet
    
    let upgradeCost = 50
    let upgradeAmount = 20
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Current Balance Banner
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Current Balance")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("$\(pet.wallet)")
                            .font(.system(size: 36, weight: .black))
                    }
                    
                    Spacer()
                    
                    Image(systemName: "banknote")
                        .font(.system(size: 40))
                        .foregroundColor(.green.opacity(0.7))
                }
                .padding(20)
                .background(Color.green.opacity(0.1))
                .cornerRadius(15)
                
                // Upgrades Header
                Text("UPGRADES")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                
                // Upgrade Cards
                VStack(spacing: 12) {
                    UpgradeCard(
                        statName: "Hunger",
                        stat: pet.hunger,
                        iconName: "fork.knife",
                        iconColor: .orange,
                        cost: upgradeCost,
                        increaseAmount: upgradeAmount,
                        walletBalance: pet.wallet
                    ) {
                        buyUpgrade(for: pet.hunger)
                    }
                    
                    UpgradeCard(
                        statName: "Cleanliness",
                        stat: pet.cleanliness,
                        iconName: "sparkles",
                        iconColor: .blue,
                        cost: upgradeCost,
                        increaseAmount: upgradeAmount,
                        walletBalance: pet.wallet
                    ) {
                        buyUpgrade(for: pet.cleanliness)
                    }
                    
                    UpgradeCard(
                        statName: "Fun",
                        stat: pet.fun,
                        iconName: "figure.run",
                        iconColor: .pink,
                        cost: upgradeCost,
                        increaseAmount: upgradeAmount,
                        walletBalance: pet.wallet
                    ) {
                        buyUpgrade(for: pet.fun)
                    }
                    
                    UpgradeCard(
                        statName: "Energy",
                        stat: pet.energy,
                        iconName: "bolt.fill",
                        iconColor: .purple,
                        cost: upgradeCost,
                        increaseAmount: upgradeAmount,
                        walletBalance: pet.wallet
                    ) {
                        buyUpgrade(for: pet.energy)
                    }
                }
            }
            .padding(20)
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("Shop")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // Purchase Logic
    private func buyUpgrade(for stat: Stat) {
        if pet.wallet >= upgradeCost {
            pet.wallet -= upgradeCost
            stat.upgradeMax(by: upgradeAmount)
        }
    }
}

#Preview {
    ShopView(pet: Pet(name: "Felix", wallet: 100))
}
