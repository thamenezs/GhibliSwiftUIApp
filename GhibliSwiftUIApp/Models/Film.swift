//
//  Film.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 24/11/25.
//
import SwiftUI

struct Film: Codable, Identifiable {
    let id: String
    let title: String
    let originalTitle: String
    let description: String
    let director: String
    let producer: String
    
    let releaseYear: String
    let duration: String
    let score: String
    
    let image: String
    let bannerImage: String
    
    let people: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, producer, director, people
        case releaseYear = "release_date"
        case bannerImage = "movie_banner"
        case duration = "running_time"
        case score = "rt_score"
        case originalTitle = "original_title"
    }
}

import Playgrounds

#Playground {
    let url = URL(string: "https://ghibliapi.vercel.app/films")!
    
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        try JSONDecoder().decode([Film].self, from: data)
        print("Success: \(response)")
    } catch {
        print(error)
    }
}
