//
//  ProductDetailViewModel.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import Observation

@Observable
final class ProductDetailViewModel {
    var error: AppError? = nil
    var quantity: Int = 0
    var isAddedToCart: Bool = false
    
    let product: ProductResponse
    private let cartRepository: CartRepository
    
    init(product: ProductResponse, cartRepository: CartRepository) {
        self.product = product
        self.cartRepository = cartRepository
    }
    
    func addToCart() {
        do {
            let productEntity = product.toProductEntity(quantity: quantity)
            try cartRepository.add(productEntity: productEntity)
            isAddedToCart = true
        } catch {
            self.error = error.toAppError()
        }
    }
}
