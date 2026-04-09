//
//  Untitled.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//
import SwiftUI

struct UpgradeCard: View {
    var statName: String
    var stat: Stat
    var iconName: String
    var iconColor: Color
    var cost: Int
    var increaseAmount: Int
    var walletBalance: Int
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            // Left Icon
            Circle()
                .fill(iconColor.opacity(0.15))
                .frame(width: 48, height: 48)
                .overlay(
                    Image(systemName: iconName)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(iconColor)
                )
            
            // Text Info
            VStack(alignment: .leading, spacing: 4) {
                Text("Max \(statName) [Current Max: \(stat.maxValue)]")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Text("Increases limit by \(increaseAmount)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Buy Button
            Button(action: action) {
                Text("BUY $\(cost)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(walletBalance >= cost ? Color.blue : Color.gray)
                    .cornerRadius(8)
            }
            .disabled(walletBalance < cost)
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

#Preview {
//    UpgradeCard(pet: Pet(name: "Jamir", wallet: 100))
}
