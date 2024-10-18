//
//  CartScene.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

enum CartScene {
    static func live(path: Binding<[Route]>) -> CartScreen {
        let persistenceController: PersistenceController = PersistenceControllerImpl.shared
        let cartRepository: CartRepository = CartRepositoryImpl(persistenceController: persistenceController)
        let viewModel = CartViewModel(cartRepository: cartRepository)
        let screen = CartScreen(viewModel: viewModel, path: path)
        return screen
    }
    
    static func preview() -> CartScreen {
        let response: [ProductResponse] = try! JSON.decode(from: "products")
        let products = response.prefix(2).map({ $0.toProductEntity(quantity: 1) })
        let cartRepository: CartRepository = CartRepositoryFake(products: products)
        let viewModel = CartViewModel(cartRepository: cartRepository)
        let screen = CartScreen(viewModel: viewModel, path: .constant([]))
        return screen
    }
}
