//
//  StatCard.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//
import SwiftUI

struct StatCard: View {
    var title: String
    var stat: Stat
    var buttonTitle: String
    var color: Color
    var isDead: Bool
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            // Stat Title
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(isDead ? .gray : .primary) // Gray text when dead
            
            // Custom Progress Bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background Track
                    Capsule()
                        .fill(Color.gray.opacity(0.15))
                    
                    // Fill Track
                    Capsule()
                        .fill(color)
                        .frame(width: calculateWidth(totalWidth: geometry.size.width))
                    
                    // Text Indicator
                    Text("\(stat.currentValue) / \(stat.maxValue)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(isDead ? .gray : .primary)
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 16)
            
            // Action Button
            Button(action: action) {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(isDead ? color.opacity(0.3) : color)
                    .cornerRadius(10)
            }
            .disabled(isDead)
        }
    }
    
    private func calculateWidth(totalWidth: CGFloat) -> CGFloat {
        let percentage = CGFloat(stat.currentValue) / CGFloat(stat.maxValue)
        let clampedPercentage = max(0, min(percentage, 1))
        return totalWidth * clampedPercentage
    }
}

#Preview {
    StatCard(title: "Hunger", stat: Stat(
        name: "Dis"
    ), buttonTitle: "Feed", color: .green, isDead: false, action: {})
}
