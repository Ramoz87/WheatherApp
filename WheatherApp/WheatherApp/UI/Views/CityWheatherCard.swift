//
//  CityWheatherCard.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import SwiftUI

struct CityWheatherCard: View {
    var model: CityWheather
    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Text(model.city)
                    .font(.system(size: 20, weight: .semibold))
                HStack(alignment: .top) {
                    Text(String(model.temperature!))
                        .font(.system(size: 60))
                    Text("°")
                        .font(.system(size: 30))
                }
            }
            Spacer()
            AsyncImage(url: model.conditionImageUrl)
        }
        .padding()
        .frame(width: .infinity, height: 117)
        .background(Color.searchBar)
        .cornerRadius(16)
    }
}
