//
//  CityWheatherCard.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import SwiftUI

struct CityWheatherCard: View {
    private let model: CityWheatherViewModel
    
    init(_ model: CityWheatherViewModel) {
        self.model = model
    }
    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Text(model.city)
                    .font(.system(size: 20, weight: .semibold))
                Text(model.temperature)
                    .font(.system(size: 60))
            }
            Spacer()
            AsyncImage(url: model.imageUrl)
        }
        .padding()
        .frame(height: 117)
        .background(Color.searchBar)
        .cornerRadius(16)
    }
}
