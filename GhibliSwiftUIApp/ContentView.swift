//
//  ContentView.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 24/11/25.
//

import SwiftUI

struct ContentView: View {
    let viewModel = FilmsViewModel()
    var body: some View {
        TabView{
            Tab("Moview", systemImage: "movieclapper") {
                SettingsView()
            }
            Tab("Favorites", systemImage: "heart") {
                FavoritesView()
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                SearchView()
            }
        }
    }
}

#Preview {
    ContentView()
}
