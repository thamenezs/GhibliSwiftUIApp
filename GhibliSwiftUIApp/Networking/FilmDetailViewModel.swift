//
//  FilmDetailviewModel.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 25/11/25.
//

import Foundation
import Observation

class FilmDetailViewModel {
    
    var people: [Person] = []
    
    let service: APIService
    
    init(service: APIService = DefaultAPIService()) {
        self.service = service
    }
    
    func fetch(for film: Film) async {
        
        do {
            try await withThrowingTaskGroup(of: Person.self) { group in
                for personInfoURL in film.people {
                    group.addTask {
                        try await self.service.fetchPerson(from: personInfoURL)
                    }
                }
            }
        } catch {
            
        }
    }
}
