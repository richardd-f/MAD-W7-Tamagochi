//
//  ContentView.swift
//  TamagochiWatchOS Watch App
//
//  Created by student on 09/04/26.
//

import SwiftUI

struct ContentView: View {
    // Shared state from the Pet model
    @State private var pet = Pet()

    var body: some View {
        TabView {
            // Page 1: Main Status View
            WatchStatusView(pet: pet)
            
            // Page 2: Hunger / Feed
            ActionPageView(
                title: "Hunger",
                stat: pet.hunger,
                icon: "fork.knife",
                color: .orange,
                buttonLabel: "Feed",
                isDisabled: pet.isDead,
                action: { pet.feed() }
            )
            
            // Page 3: Cleanliness / Clean
            ActionPageView(
                title: "Cleanliness",
                stat: pet.cleanliness,
                icon: "sparkles",
                color: .blue,
                buttonLabel: "Clean",
                isDisabled: pet.isDead,
                action: { pet.clean() }
            )
            
            // Page 4: Energy / Rest
            ActionPageView(
                title: "Energy",
                stat: pet.energy,
                icon: "moon.fill",
                color: .purple,
                buttonLabel: "Rest",
                isDisabled: pet.isDead,
                action: { pet.rest() }
            )
            
            // Page 5: Fun / Play
            ActionPageView(
                title: "Fun",
                stat: pet.fun,
                icon: "figure.run",
                color: .pink,
                buttonLabel: "Play",
                isDisabled: pet.isDead,
                action: { pet.play() }
            )
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
