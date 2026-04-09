//
//  StatusRow.swift
//  TamagochiWatchOS Watch App
//
//  Created by student on 09/04/26.
//

import SwiftUI

struct StatusRow: View {
    let label: String
    let value: Stat
    let color: Color
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text("\(Int(Double(value.currentValue) / Double(value.maxValue) * 100))%")
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

#Preview {
    StatusRow(
        label: "Hunger",
        value: Stat(name: "Hunger", currentValue: 140, maxValue: 150),
        color: .orange
    )
}
