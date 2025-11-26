//
//  APIService.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 25/11/25.
//

import Foundation

protocol APIService: Sendable {
    func fetchFilms() async throws -> [Film]
    func fetchPerson(from URLString: String) async throws -> Person
}
