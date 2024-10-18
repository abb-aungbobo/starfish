//
//  ProductEntity.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import Foundation
import RealmSwift

final class ProductEntity: EmbeddedObject, Identifiable {
    @Persisted var id: Int
    @Persisted var title: String
    @Persisted var price: Double
    @Persisted var image: String
    @Persisted var quantity: Int
    
    var totalPrice: Double {
        price * Double(quantity)
    }
}

extension ProductEntity {
    func toCartCardViewModel() -> CartCardViewModel {
        let formattedPrice = price.formatted(.number.precision(.fractionLength(2)))
        let formattedTotalPrice = totalPrice.formatted(.number.precision(.fractionLength(2)))
        return CartCardViewModel(
            image: URL(string: image),
            title: title,
            price: String(format: "$%@ (total: $%@)", formattedPrice, formattedTotalPrice),
            quantity: Double(quantity)
        )
    }
}
