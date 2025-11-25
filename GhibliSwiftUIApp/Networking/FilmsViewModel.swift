//
//  FilmsViewModel.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 24/11/25.
//

import Foundation
import Observation

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
@Observable
class FilmsViewModel {
    
    enum State: Equatable {
        case idle
        case loading
        case loaded([Film])
        case error(String)
    }
    
    var state: State = .idle
    var films: [Film] = []
    
    func fetch() async {
        guard state == .idle else { return }
        state = .loading
        do {
            let films = try await fetchFilms()
            self.state = .loaded(films)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } catch {
            self.state = .error("unknown error")
        }
    }
    
    private func fetchFilms()  async throws -> [Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            return try JSONDecoder().decode([Film].self, from: data)
            
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkedError(error)
        }
    }
}
