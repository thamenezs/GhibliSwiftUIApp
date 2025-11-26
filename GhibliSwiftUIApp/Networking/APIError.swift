//
//  APIError.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 25/11/25.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decoding(Error)
    case networkedError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid"
        case .invalidResponse:
            return "Invalid response from server"
        case .decoding(let error):
            return "Faild to decode response: \(error.localizedDescription)"
        case .networkedError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}
