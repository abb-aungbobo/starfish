//
//  ProductRepositoryImpl.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import Foundation

final class ProductRepositoryImpl: ProductRepository {
    private let networkController: NetworkController
    
    init(networkController: NetworkController) {
        self.networkController = networkController
    }
    
    func getProducts() async throws -> [ProductResponse] {
        let endpoint: ProductsEndpoint = .products
        let response: [ProductResponse] = try await networkController.request(for: endpoint)
        return response
    }
}
