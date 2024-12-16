//
//  APIWheatherLoaderDataMapper.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//
import Foundation

internal final class APIWheatherLoaderDataMapper {
    internal static func map(_ data: Data, _ response: URLResponse) throws -> CityWheather {
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw APIWheatherLoader.Error.invalidResponse
        }
        
        let successCodes = Range(uncheckedBounds: (200, 300))
        let result = try JSONDecoder().decode(Response.self, from: data)
        
        guard successCodes.contains(statusCode), let wheather = result.wheather else  {
            if let error = result.error {
                throw error
            } else {
                throw APIWheatherLoader.Error.invalidResponse
            }
        }
        
        return wheather
    }
}
