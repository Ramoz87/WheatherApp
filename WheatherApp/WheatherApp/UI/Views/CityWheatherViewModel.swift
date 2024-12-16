//
//  Untitled.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

struct CityWheatherViewModel {
    let city: String
    let temperature: String
    let feelsLikeTemperature: String
    let humidity: String
    let uvIndex: String
    let imageUrl: URL?
    
    init(_ wheather: CityWheather) {
        self.city = wheather.city
        self.imageUrl = wheather.conditionImageUrl
        
        if let value = wheather.temperature {
            self.temperature = String(Int(value)) + "°"
        } else {
            self.temperature = ""
        }
        
        if let value = wheather.feelsLikeTemperature {
            self.feelsLikeTemperature = String(Int(value)) + "°"
        } else {
            self.feelsLikeTemperature = ""
        }
        
        if let value = wheather.humidity {
            self.humidity = String(Int(value)) + "%"
        } else {
            self.humidity = ""
        }
        
        if let value = wheather.uvIndex {
            self.uvIndex = String(Int(value))
        } else {
            self.uvIndex = ""
        }
    }
}
