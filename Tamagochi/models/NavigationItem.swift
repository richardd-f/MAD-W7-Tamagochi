//
//  NavigationItem.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//

import SwiftUI

enum NavigationItem: String, CaseIterable, Identifiable {
    case status = "Status"
    case shop = "Shop"
    case about = "About"
    
    var id: String { self.rawValue }
    
    var iconName: String {
        switch self {
        case .status: return "heart.fill"
        case .shop: return "cart.fill"
        case .about: return "info.circle"
        }
    }
}
