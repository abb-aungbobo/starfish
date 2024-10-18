//
//  CheckoutView.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

struct CheckoutView: View {
    @Binding var totalPrice: Double
    
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
                Text("Total")
                    .font(.headline)
                
                Spacer()
                
                Text(String(format: "$%.2f", totalPrice))
                    .font(.headline)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            Button(action: action) {
                Text("Checkout")
                    .frame(maxWidth: .infinity)
            }
            .disabled(totalPrice == 0)
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .background(.background)
        .overlay(alignment: .top) {
            Divider()
        }
    }
}

#Preview {
    CartScene.preview()
}
