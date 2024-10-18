//
//  ProductDetailScene.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

enum ProductDetailScene {
    static func live(product: ProductResponse) -> ProductDetailScreen {
        let persistenceController: PersistenceController = PersistenceControllerImpl.shared
        let cartRepository: CartRepository = CartRepositoryImpl(persistenceController: persistenceController)
        let viewModel = ProductDetailViewModel(product: product, cartRepository: cartRepository)
        let screen = ProductDetailScreen(viewModel: viewModel)
        return screen
    }
    
    static func preview() -> ProductDetailScreen {
        let products: [ProductResponse] = try! JSON.decode(from: "products")
        let product: ProductResponse = products[0]
        let cartRepository: CartRepository = CartRepositoryFake(products: [])
        let viewModel = ProductDetailViewModel(product: product, cartRepository: cartRepository)
        let screen = ProductDetailScreen(viewModel: viewModel)
        return screen
    }
}
