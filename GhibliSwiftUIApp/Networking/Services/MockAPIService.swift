//
//  MockAPIService.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 25/11/25.
//

import Foundation

struct MockAPIService: APIService {
    
    private struct SampleData: Decodable {
        let films: [Film]
        let people: [Person]
    }
    
    private func loadSampleData() throws -> SampleData {
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json") else {
            throw APIError.invalidURL
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(SampleData.self, from: data)
            
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch {
            throw APIError.networkedError(error)
        }
    }
    
    func fetchFilms() async throws -> [Film] {
        let data = try loadSampleData()
        
        return data.films
    }
        
    func fetchPerson(from URLString: String) async throws -> Person {
        let data = try loadSampleData()
        return data.people.first!
    }
    
    func fetchFilm() -> Film {
        let data = try! loadSampleData()
        return data.films.first!
    }
    
}
