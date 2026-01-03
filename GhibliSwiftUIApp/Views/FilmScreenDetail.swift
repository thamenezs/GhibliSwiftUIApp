//
//  FilmScreenDetail.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 02/01/26.
//

import SwiftUI

struct FilmScreenDetail: View {
    
    let film: Film
    
    @State private var viewModel = FilmDetailViewModel()
    var body: some View {
        VStack {
            Text(film.title)
            Divider()
            Text("Characters")
                .font(.title3)
            switch viewModel.state {
            case . idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded(let people):
                ForEach(people) { person in
                    Text(person.name)
                }
            case .error(let error):
                Text(error)
                    .foregroundStyle(Color.pink)
            }
        }
        .task {
            await viewModel.fetch(for: film)
        }
    }
}

#Preview {
    FilmScreenDetail(film: Film.example)
}
