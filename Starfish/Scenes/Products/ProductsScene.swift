//
//  ProductsScene.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

enum ProductsScene {
    static func live() -> ProductsScreen {
        let networkController: NetworkController = NetworkControllerImpl.shared
        let productRepository: ProductRepository = ProductRepositoryImpl(networkController: networkController)
        let viewModel = ProductsViewModel(productRepository: productRepository)
        let screen = ProductsScreen(viewModel: viewModel)
        return screen
    }
    
    static func preview() -> ProductsScreen {
        let productRepository: ProductRepository = ProductRepositoryStub()
        let viewModel = ProductsViewModel(productRepository: productRepository)
        let screen = ProductsScreen(viewModel: viewModel)
        return screen
    }
}
