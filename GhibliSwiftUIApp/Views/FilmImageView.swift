//
//  FilmImageView.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 03/01/26.
//

import SwiftUI

struct FilmImageView: View {
    
    let url: URL?
    
    init(urlPath: String) {
        self.url = URL(string: urlPath)
    }
    
    init(url: URL?) {
        self.url = url
    }
    var body: some View {
        
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                Color(white: 0.8)
                    .overlay {
                        ProgressView()
                            .controlSize(.large)
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(let error):
                Text("Could not load image: \(error.localizedDescription)")
            @unknown default:
                fatalError()
            }
        }
    }
}

#Preview("banner image") {
    FilmImageView(url: URL.convertAssetImage(named: "banner"))
        .frame(height: 250)
}

#Preview("poster image") {
    FilmImageView(url: URL.convertAssetImage(named: "posterImage"))
        .frame(height: 250)
}
