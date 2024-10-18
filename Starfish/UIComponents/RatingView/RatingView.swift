//
//  RatingView.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

struct RatingView: View {
    let rate: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(.tint)
            
            Text(rate)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    RatingView(rate: "4.9")
}
