//
//  FilmListView.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 24/11/25.
//

import Foundation
import SwiftUI

struct FilmListView: View {
    
    var filmsViewModel: FilmsViewModel
    
    var body: some View {
        NavigationStack {
            switch filmsViewModel.state {
            case .idle:
                Text("No films yet")
            case .loading:
                ProgressView {
                    Text("Loading...")
                }
            case .loaded(let films):
                List(films) { film in
                    NavigationLink(value: film){
                        Text(film.title)
                    }
                }
                .navigationDestination(for: Film.self) { film in
                    FilmScreenDetail(film: film)
                }
            case .error(let error):
                Text(error)
                    .foregroundStyle(.pink)
            }
        }
        .task {
            await filmsViewModel.fetch()
        }
    }
}

#Preview {
    
    @State @Previewable var vm = FilmsViewModel(service: MockAPIService())
    FilmListView(filmsViewModel: vm)
}
