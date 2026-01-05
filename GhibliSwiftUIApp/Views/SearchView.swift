//
//  SearchView.swift
//  GhibliSwiftUIApp
//
//  Created by Thais Souza on 05/01/26.
//

import SwiftUI

struct SearchView: View {
    
    @State var text = ""
    var body: some View {
        NavigationStack {
            Text("Search me biiiiiitch")
                .searchable(text: $text)
        }
    }
}

#Preview {
    SearchView()
}
