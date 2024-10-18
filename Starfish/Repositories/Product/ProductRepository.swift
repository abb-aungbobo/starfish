//
//  ProductRepository.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import Foundation

protocol ProductRepository {
    func getProducts() async throws -> [ProductResponse]
}
