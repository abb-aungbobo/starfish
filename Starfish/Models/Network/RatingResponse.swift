//
//  RatingResponse.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import Foundation

struct RatingResponse: Codable, Hashable {
    let rate: Double
    let count: Int
}
