//
//  AboutView.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//

import SwiftUI

struct DashboardView: View {
    var pet: Pet
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // State for notification
    @State private var activeChanges: [StatChange] = []
    @State private var fadeTask: Task<Void, Never>? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // Pet Image
                Image(pet.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .grayscale(pet.isDead ? 1.0 : 0.0)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(UIColor.systemBackground))
                            .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                    )
                    .padding(.horizontal, 20)
                
                // Conditional Pet Name / Death Screen
                if pet.isDead {
                    VStack(spacing: 12) {
                        Text("\(pet.name) has died.")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Button(action: {
                            pet.revive()
                        }) {
                            Text("Revive")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .clipShape(Capsule())
                        }
                    }
                } else {
                    Text(pet.name)
                        .font(.system(size: 32, weight: .black))
                }
                
                // Stats Grid
                LazyVGrid(columns: columns, spacing: 20) {
                    StatCard(
                        title: "Hunger",
                        stat: pet.hunger,
                        buttonTitle: "Feed",
                        color: .orange,
                        isDead: pet.isDead
                    ) {
                        handleAction(pet.feed())
                    }
                    
                    StatCard(
                        title: "Cleanliness",
                        stat: pet.cleanliness,
                        buttonTitle: "Clean",
                        color: .blue,
                        isDead: pet.isDead
                    ) {
                        handleAction(pet.clean())
                    }
                    
                    StatCard(
                        title: "Fun",
                        stat: pet.fun,
                        buttonTitle: "Play",
                        color: .pink,
                        isDead: pet.isDead
                    ) {
                        handleAction(pet.play())
                    }
                    
                    StatCard(
                        title: "Energy",
                        stat: pet.energy,
                        buttonTitle: "Rest",
                        color: .purple,
                        isDead: pet.isDead
                    ) {
                        handleAction(pet.rest())
                    }
                }
                .padding(.horizontal, 20)
                
                // Wallet Indicator
                Text("Wallet: $\(pet.wallet)")
                    .font(.headline)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(20)
                    .padding(.top, 10)
                
                // Notifications
                if !activeChanges.isEmpty {
                    HStack(spacing: 8) {
                        ForEach(activeChanges) { change in
                            Text(change.text)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(change.isPositive ? .green : .red)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(change.isPositive ? Color.green.opacity(0.15) : Color.red.opacity(0.15))
                                .clipShape(Capsule())
                        }
                    }
                    .transition(.opacity)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private func handleAction(_ changes: [StatChange]) {
            guard !changes.isEmpty else { return }
            
            // Show the new changes immediately
            withAnimation {
                activeChanges = changes
            }
            
            // Cancel any existing fade out task (if the user taps rapidly)
            fadeTask?.cancel()
            
            // Create a new task to fade them out after 5 seconds
            fadeTask = Task {
                try? await Task.sleep(nanoseconds: 5_000_000_000) // 5 seconds
                
                if !Task.isCancelled {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        activeChanges = []
                    }
                }
            }
        }
}

#Preview {
    DashboardView(pet: Pet(name: "Jamir", wallet: 100))
}
