//
//  AddToCartView.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

struct AddToCartView: View {
    @Binding var quantity: Int
    
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Stepper(value: $quantity, in: 0...100) {
                Text(quantity.description)
                    .font(.headline)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            Button(action: action) {
                Text("Add to cart")
                    .frame(maxWidth: .infinity)
            }
            .disabled(quantity == 0)
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
    ProductDetailScene.preview()
}
