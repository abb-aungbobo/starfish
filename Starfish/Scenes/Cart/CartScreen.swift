//
//  CartScreen.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

struct CartScreen: View {
    @State private var isPressedCheckout = false
    
    @Bindable var viewModel: CartViewModel
    
    @Binding var path: [Route]
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                CartCardView(viewModel: product.toCartCardViewModel()) { quantity in
                    viewModel.update(quantity: quantity, productEntity: product)
                }
                .listRowSeparator(.hidden)
            }
            .onDelete { indexSet in
                guard let index = indexSet.first else { return }
                let product = viewModel.products[index]
                viewModel.delete(at: index)
                viewModel.delete(productEntity: product)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
        .overlay {
            if viewModel.products.isEmpty {
                ContentUnavailableView("Your cart is empty", systemImage: "cart.fill")
            }
        }
        .safeAreaInset(edge: .bottom) {
            if !viewModel.products.isEmpty {
                CheckoutView(totalPrice: $viewModel.totalPrice) {
                    isPressedCheckout = true
                }
            }
        }
        .alert(item: $viewModel.error, content: Alert.init)
        .alert(isPresented: $isPressedCheckout) {
            Alert(
                title: Text("Order Successful"),
                message: Text("Thank you so much for your order."),
                dismissButton: .default(Text("OK")) {
                    viewModel.delete()
                    path.removeAll()
                }
            )
        }
        .onAppear {
            viewModel.getProducts()
        }
    }
}

#Preview {
    CartScene.preview()
}
