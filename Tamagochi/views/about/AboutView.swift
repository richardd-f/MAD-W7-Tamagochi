//
//  StatusView.swift
//  Tamagochi
//
//  Created by student on 09/04/26.
//

import SwiftUI

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Info Icon
            Image(systemName: "info.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
            
            // App Title
            Text("Pet Simulator")
                .font(.system(size: 34, weight: .bold))
            
            // Information Content
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    HStack {
                        Text("Name:").fontWeight(.bold)
                        Text("Felix")
                    }
                    HStack {
                        Text("NIM:").fontWeight(.bold)
                        Text("0706012410058")
                    }
                    HStack {
                        Text("Class:").fontWeight(.bold)
                        Text("MAD - Lab Week 7")
                    }
                }
                .font(.body)
            }
            .padding(25)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(UIColor.secondarySystemBackground))
            )
            
            // Description
            Text("This app demonstrates cross-platform state management between iPadOS and watchOS.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding(.top, 50)
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}
