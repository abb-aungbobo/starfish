//
//  ProductDetailCardView.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct ProductDetailCardView: View {
    let viewModel: ProductDetailCardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 16) {
                WebImage(url: viewModel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 96, height: 96)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.price)
                        .font(.headline)
                    
                    Text(viewModel.category)
                        .font(.subheadline)
                    
                    RatingView(rate: viewModel.rate)
                }
            }
            
            Text(viewModel.title)
                .font(.headline)
                .padding(.top, 16)
            
            Text(viewModel.description)
                .font(.body)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
        }
        .padding(16)
    }
}

#Preview {
    ProductDetailScene.preview()
}
