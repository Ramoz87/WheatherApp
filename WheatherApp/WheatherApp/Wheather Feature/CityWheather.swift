//
//  CityWheather.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

public struct CityWheather {
    public let city: String
    public let temperature: Double
    public let feelsLikeTemperature: Double
    public let humidity: Double
    public let uvIndex: Double
    public let conditionImageUrl: URL
}
