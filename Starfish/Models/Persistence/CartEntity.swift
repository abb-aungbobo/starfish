//
//  CartEntity.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import RealmSwift

final class CartEntity: Object {
    @Persisted(primaryKey: true) var id: Int = 1
    @Persisted var products: List<ProductEntity> = List<ProductEntity>()
}
