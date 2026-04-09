//
//  ActionPageView.swift
//  TamagochiWatchOS Watch App
//
//  Created by student on 09/04/26.
//

import SwiftUI

struct ActionPageView: View {
    let title: String
    let stat: Stat
    let icon: String
    let color: Color
    let buttonLabel: String
    let isDisabled: Bool
    let action: () -> Void
    
    var percentage: Int {
        Int(Double(stat.currentValue) / Double(stat.maxValue) * 100)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(isDisabled ? .gray : color)
            
            Text(title)
                .font(.headline)
                .foregroundColor(isDisabled ? .gray : .primary)
            
            // Progress Bar
            ProgressView(value: Double(stat.currentValue), total: Double(stat.maxValue))
                .tint(isDisabled ? .gray : color)
                .padding(.horizontal)
            
            Text("\(percentage)%")
                .font(.footnote)
                .foregroundColor(isDisabled ? .gray : .secondary)
            
            Button(action: action) {
                Text(buttonLabel)
            }
            .tint(color)
            .padding(.horizontal)
            .disabled(isDisabled)
        }
    }
}

#Preview{
    ActionPageView(
        title: "Hunger",
        stat: Stat(name: "Hunger", currentValue: 10, maxValue: 150),
        icon: "fork.knife",
        color: .orange,
        buttonLabel: "Feed",
        isDisabled: false,
        action: {
            print("Feed button pressed")
        }
    )
}
