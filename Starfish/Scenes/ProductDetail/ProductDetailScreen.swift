//
//  ProductDetailScreen.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

struct ProductDetailScreen: View {
    @Bindable var viewModel: ProductDetailViewModel
    
    var body: some View {
        ScrollView {
            ProductDetailCardView(viewModel: viewModel.product.toProductDetailCardViewModel())
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: Route.cart) {
                    Image(systemName: "cart")
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            AddToCartView(quantity: $viewModel.quantity) {
                viewModel.addToCart()
            }
        }
        .alert(item: $viewModel.error, content: Alert.init)
        .alert(isPresented: $viewModel.isAddedToCart) {
            Alert(
                title: Text("Added to cart"),
                message: Text("\(viewModel.product.title) (quantity: \(viewModel.quantity)) added to cart."),
                dismissButton: .cancel(Text("OK"))
            )
        }
    }
}

#Preview {
    ProductDetailScene.preview()
}
