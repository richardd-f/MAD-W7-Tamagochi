//
//  WatchStatusView.swift
//  TamagochiWatchOS Watch App
//
//  Created by student on 09/04/26.
//

import SwiftUI

struct WatchStatusView: View {
    var pet: Pet
    
    var body: some View {
        ZStack {
            // Layer 1: Status Content
            VStack(spacing: 8) {
                Text(pet.isDead ? "\(pet.name) has died" : "Status")
                    .font(.headline)
                    .foregroundColor(pet.isDead ? .red : .gray)
                
                VStack(spacing: 4) {
                    StatusRow(label: "Hunger", value: pet.hunger, color: pet.isDead ? .gray : .orange)
                    StatusRow(label: "Clean", value: pet.cleanliness, color: pet.isDead ? .gray : .blue)
                    StatusRow(label: "Energy", value: pet.energy, color: pet.isDead ? .gray : .purple)
                    StatusRow(label: "Fun", value: pet.fun, color: pet.isDead ? .gray : .pink)
                }
                .grayscale(pet.isDead ? 1.0 : 0.0)
                .blur(radius: pet.isDead ? 2 : 0)
            }
            
            // Layer 2: Centered Revive Button Overlay
            if pet.isDead {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                Button(action: {
                    pet.revive()
                }) {
                    VStack {
                        Image(systemName: "heart.flash.fill")
                            .font(.title3)
                        Text("Revive")
                            .fontWeight(.bold)
                    }
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.default, value: pet.isDead)
    }
}

#Preview {
    WatchStatusView(pet: Pet(name: "Jamir", wallet: 100))
}
