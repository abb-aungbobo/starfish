//
//  Route.swift
//  Starfish
//
//  Created by Aung Bo Bo on 22/05/2024.
//

import SwiftUI

enum Route: Hashable {
    case productDetail(ProductResponse)
    case cart
    
    @ViewBuilder
    static func destination(route: Route, path: Binding<[Route]>) -> some View {
        switch route {
        case let .productDetail(product):
            ProductDetailScene.live(product: product)
        case .cart:
            CartScene.live(path: path)
        }
    }
}
