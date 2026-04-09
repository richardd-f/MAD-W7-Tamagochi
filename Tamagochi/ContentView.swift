//
//  ContentView.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItem: NavigationItem? = .status
    
    // Controls the visibility of the sidebar on iPad
    @State private var columnVisibility = NavigationSplitViewVisibility.all

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            // Sidebar Menu
            List(NavigationItem.allCases, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    Label(item.rawValue, systemImage: item.iconName)
                }
            }
            .navigationTitle("Tamagochi")
            .listStyle(.sidebar)
            
        } detail: {
            switch selectedItem {
            case .status:
                StatusView()
            case .shop:
                ShopView()
            case .about:
                AboutView()
            case .none:
                Text("Select an item to begin.")
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    ContentView()
}
