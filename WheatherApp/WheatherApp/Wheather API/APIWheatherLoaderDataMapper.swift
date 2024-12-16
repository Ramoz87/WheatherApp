//
//  APIWheatherLoaderDataMapper.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//
import Foundation

internal final class APIWheatherLoaderDataMapper {
    
    private struct Response: Decodable {
        let location: Location
        let current: Wheather
    }

    private struct Location: Decodable {
        let name: String
    }
    
    private struct Wheather: Decodable {
        let temp_c: Double
        let feelslike_c: Double
        let humidity: Double
        let uv: Double
        let condition: Condition
        
    }
    
    private struct Condition: Decodable {
        let icon: String
    }
    
    internal static func map(_ data: Data, _ response: URLResponse) throws -> CityWheather {
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw APIWheatherLoader.Error.invalidResponse(statusCode: -1)
        }
                
        let successCodes = Range(uncheckedBounds: (200, 300))
        guard successCodes.contains(statusCode) else {
            throw APIWheatherLoader.Error.invalidResponse(statusCode: statusCode)
        }
                
        let result = try JSONDecoder().decode(Response.self, from: data)
        
        let wheather = CityWheather (
            city: result.location.name,
            temperature: result.current.temp_c,
            feelsLikeTemperature: result.current.feelslike_c,
            humidity: result.current.humidity,
            uvIndex: result.current.uv,
            conditionImageUrl: URL(string: result.current.condition.icon)
        )
        
        return wheather
    }
}
