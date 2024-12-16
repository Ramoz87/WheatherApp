//
//  Untitled.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

struct CityWheatherViewModel {
    private let wheather: CityWheather
    
    init(_ wheather: CityWheather) {
        self.wheather = wheather
    }
    
    var city: String {
        wheather.city
    }
    var imageUrl: URL? {
        wheather.conditionImageUrl
    }
    var temperature: String {
        if let value = wheather.temperature {
            return "\(Int(value))°"
        } else {
            return ""
        }
    }
    var feelsLikeTemperature: String {
        if let value = wheather.feelsLikeTemperature {
            return "\(Int(value))°"
        } else {
            return ""
        }
    }
    var humidity: String {
        if let value = wheather.humidity {
            return "\(Int(value))%"
        } else {
            return ""
        }
    }
    var uvIndex: String {
        if let value = wheather.uvIndex {
            return String(Int(value))
        } else {
            return ""
        }
    }
}
