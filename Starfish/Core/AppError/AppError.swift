//
//  AppError.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import SwiftUI

enum AppError: LocalizedError, Identifiable {
    case generic
    case networking
    case encoding
    case decoding
    case failure(Error)
    
    var id: String { localizedDescription }
    
    var errorDescription: String? {
        switch self {
        case .generic: return "Something went wrong"
        case .networking: return "Request to server failed"
        case .encoding: return "Failed parsing request to server"
        case .decoding: return "Failed parsing response from server"
        case let .failure(error): return error.localizedDescription
        }
    }
}

extension Error {
    func toAppError() -> AppError {
        switch self {
        case is URLError: return .networking
        case is EncodingError: return .encoding
        case is DecodingError: return .decoding
        default: return .failure(self)
        }
    }
}

extension Alert {
    init(error: AppError) {
        self.init(title: Text("Oops!"), message: Text(error.localizedDescription), dismissButton: .cancel(Text("Dismiss")))
    }
}
