//
//  CityWheatherView.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import SwiftUI

struct CityWheatherView: View {
    private let model: CityWheatherViewModel
    
    init(_ model: CityWheatherViewModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: model.imageUrl) { phase in
                if case let .success(image) = phase {
                    image.resizable()
                }
            }
            .frame(width: 128, height: 128)
            
            HStack {
                Text(model.city)
                    .font(.system(size: 30, weight: .semibold))
                Image("vector")
            }
            
            Text(model.temperature)
                .font(.system(size: 70, weight: .semibold))
            
            WheatherValuesView(model)
        }
    }
}

struct WheatherValuesView: View {
    private var model: CityWheatherViewModel
    
    init(_ model: CityWheatherViewModel) {
        self.model = model
    }
    
    var body: some View {
        HStack {
            ValueView(text: "Humidity", value: model.humidity)
            Spacer()
            ValueView(text: "UV", value: model.uvIndex)
            Spacer()
            ValueView(text: "Feels like", value: model.feelsLikeTemperature)
        }
        .frame(width: 274, height: 75)
        .background(Color.searchBar)
        .cornerRadius(16)
    }
}

struct ValueView: View {
    let text: String
    let value: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 12))
                .foregroundStyle(Color.textParam)
                .padding(.bottom, 2)
            Text(value)
                .font(.system(size: 15))
                .foregroundStyle(Color.textValue)
        }.padding()
    }
}
