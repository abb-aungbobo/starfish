//
//  ProductRepositoryStub.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import Foundation

final class ProductRepositoryStub: ProductRepository {
    func getProducts() async throws -> [ProductResponse] {
        let response: [ProductResponse] = try JSON.decode(from: "products")
        return response
    }
}
