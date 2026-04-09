//
//  StatChange.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//

import Foundation

struct StatChange: Identifiable {
    let id = UUID()
    let text: String
    let isPositive: Bool
}
