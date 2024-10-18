//
//  ProductsViewModel.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import Observation

@Observable
final class ProductsViewModel {
    var isLoading: Bool = false
    var error: AppError? = nil
    var products: [ProductResponse] = []
    
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    @MainActor
    func getProducts() async {
        isLoading = true
        do {
            products = try await productRepository.getProducts()
            isLoading = false
        } catch {
            self.error = error.toAppError()
            isLoading = false
        }
    }
}
