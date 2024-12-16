//
//  CityWheatherView.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import SwiftUI

struct CityWheatherView: View {
    var wheather: CityWheather
    
    var body: some View {
        VStack {
            AsyncImage(url: wheather.conditionImageUrl) { phase in
                if case let .success(image) = phase {
                    image.resizable()
                }
            }
            .frame(width: 128, height: 128)
            
            HStack {
                Text(wheather.city)
                    .font(.system(size: 30, weight: .semibold))
                Image("vector")
            }
            
            HStack(alignment: .top) {
                Text(String(wheather.temperature!))
                    .font(.system(size: 70, weight: .semibold))
                Text("°")
                    .font(.system(size: 35))
            }
            
            WheatherValuesView(wheather: wheather)
        }
    }
}

struct WheatherValuesView: View {
    var wheather: CityWheather
    
    var body: some View {
        HStack {
            ValueView(text: "Humidity", value: String(wheather.humidity!))
            Spacer()
            ValueView(text: "UV", value: String(wheather.uvIndex!))
            Spacer()
            ValueView(text: "Feels like", value: String(wheather.feelsLikeTemperature!))
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
                .foregroundStyle(Color.textWheatherParam)
                .padding(.bottom, 2)
            Text(value)
                .font(.system(size: 15))
                .foregroundStyle(Color.textwheatherValue)
        }.padding()
    }
}
