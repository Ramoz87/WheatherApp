//
//  APIWheatherResponse.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

internal struct Response: Decodable {
    let location: Location?
    let current: Wheather?
    let error: ResponseError?
    
    var wheather: CityWheather? {
        guard let location, let current else {
            return nil
        }
        
        return .init(city: location.name,
                     temperature: current.temp_c,
                     feelsLikeTemperature: current.feelslike_c,
                     humidity: current.humidity,
                     uvIndex: current.uv,
                     conditionImageUrl: URL(string: current.condition.icon)
        )
    }
}

internal struct Location: Decodable {
    let name: String
}

internal struct Wheather: Decodable {
    let temp_c: Double
    let feelslike_c: Double
    let humidity: Double
    let uv: Double
    let condition: Condition
    
}

internal struct Condition: Decodable {
    let icon: String
}

public struct ResponseError: Error, Decodable {
    let code: Int
    let message: String
}
