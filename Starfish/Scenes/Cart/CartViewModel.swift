//
//  CartViewModel.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import Observation

@Observable
final class CartViewModel {
    var error: AppError? = nil
    var totalPrice: Double = 0.0
    var products: [ProductEntity] = []
    
    private let cartRepository: CartRepository
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func getProducts() {
        do {
            products = try cartRepository.getProducts()
            totalPrice = products.map(\.totalPrice).reduce(0, +)
        } catch {
            self.error = error.toAppError()
        }
    }
    
    func update(quantity: Int, productEntity: ProductEntity) {
        do {
            try cartRepository.update(quantity: quantity, productEntity: productEntity)
            getProducts()
        } catch {
            self.error = error.toAppError()
        }
    }
    
    func delete(at index: Int) {
        products.remove(at: index)
    }
    
    func delete(productEntity: ProductEntity) {
        do {
            try cartRepository.delete(productEntity: productEntity)
            getProducts()
        } catch {
            self.error = error.toAppError()
        }
    }
    
    func delete() {
        do {
            try cartRepository.delete()
            getProducts()
        } catch {
            self.error = error.toAppError()
        }
    }
}
