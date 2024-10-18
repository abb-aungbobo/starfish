//
//  CartCardView.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct CartCardView: View {
    @State private var quantity: Double
    
    let viewModel: CartCardViewModel
    
    var onQuantityChanged: (Int) -> Void
    
    init(viewModel: CartCardViewModel, onQuantityChanged: @escaping (Int) -> Void) {
        self._quantity = State(initialValue: viewModel.quantity)
        self.viewModel = viewModel
        self.onQuantityChanged = onQuantityChanged
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            WebImage(url: viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 96, height: 96)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(viewModel.price)
                    .font(.subheadline)
                
                Stepper(value: $quantity, in: 0...100) {
                    Text(Int(viewModel.quantity).description)
                        .font(.headline)
                }
            }
        }
        .onChange(of: quantity) {
            onQuantityChanged(Int(quantity))
        }
    }
}

#Preview {
    CartScene.preview()
}
