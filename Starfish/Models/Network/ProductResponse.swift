//
//  ProductResponse.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import Foundation

struct ProductResponse: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: RatingResponse
}

extension ProductResponse {
    func toProductCardViewModel() -> ProductCardViewModel {
        let formattedPrice = price.formatted(.number.precision(.fractionLength(2)))
        return ProductCardViewModel(
            image: URL(string: image),
            title: title,
            price: String(format: "$%@", formattedPrice),
            rate: rating.rate.description
        )
    }
    
    func toProductDetailCardViewModel() -> ProductDetailCardViewModel {
        let formattedPrice = price.formatted(.number.precision(.fractionLength(2)))
        return ProductDetailCardViewModel(
            image: URL(string: image),
            title: title,
            description: description,
            price: String(format: "$%@", formattedPrice),
            category: category,
            rate: rating.rate.description
        )
    }
    
    func toProductEntity(quantity: Int) -> ProductEntity {
        let productEntity = ProductEntity()
        productEntity.id = id
        productEntity.title = title
        productEntity.price = price
        productEntity.image = image
        productEntity.quantity = quantity
        return productEntity
    }
}
