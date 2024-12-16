//
//  CityWheather.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

public struct CityWheather {
    public let city: String
    public let temperature: Double?
    public let feelsLikeTemperature: Double?
    public let humidity: Double?
    public let uvIndex: Double?
    public let conditionImageUrl: URL?
    
    init(city: String, temperature: Double? = nil, feelsLikeTemperature: Double? = nil, humidity: Double? = nil, uvIndex: Double? = nil, conditionImageUrl: URL? = nil) {
        self.city = city
        self.temperature = temperature
        self.feelsLikeTemperature = feelsLikeTemperature
        self.humidity = humidity
        self.uvIndex = uvIndex
        self.conditionImageUrl = conditionImageUrl
    }
}
