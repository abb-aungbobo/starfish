//
//  NetworkController.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import Foundation

protocol NetworkController {
    func request<T: Codable>(for endpoint: Endpoint) async throws -> T
}
