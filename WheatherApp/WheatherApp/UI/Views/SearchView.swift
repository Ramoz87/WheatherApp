//
//  SearchView.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Search Location", text: $text)
                .frame(height: 46)
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.magnifyingGlass)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .background(Color.searchBar)
        .cornerRadius(16)
    }
}
