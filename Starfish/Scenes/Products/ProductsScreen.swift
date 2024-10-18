//
//  ProductsScreen.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

struct ProductsScreen: View {
    @State var viewModel: ProductsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                NavigationLink(value: Route.productDetail(product)) {
                    ProductCardView(viewModel: product.toProductCardViewModel())
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Starfish")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: Route.cart) {
                    Image(systemName: "cart")
                }
            }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert(item: $viewModel.error, content: Alert.init)
        .task {
            await viewModel.getProducts()
        }
    }
}

#Preview {
    ProductsScene.preview()
}
