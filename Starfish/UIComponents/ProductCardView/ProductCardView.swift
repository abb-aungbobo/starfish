//
//  ProductCardView.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct ProductCardView: View {
    let viewModel: ProductCardViewModel
    
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
                
                RatingView(rate: viewModel.rate)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ProductsScene.preview()
}
