//
//  APIWheatherLoader.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

final public class APIWheatherLoader: WheatherLoader {
    private let client: HTTPClient
    private let baseUrl = "https://api.weatherapi.com/v1/current.json"
    private let apiKey = "c2cde0a947254c0a80e154736241512"
    
    public enum Error: Swift.Error {
        case invalidResponse
        case network(error: URLError)
        case decoding(error: DecodingError)
        case server(error: ResponseError)
        case undefined(error: Swift.Error)
    }
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    public func load(city: String) async throws -> CityWheather {
        do {
            let url = try buildURL(city: city)
            let (data, response) = try await client.load(from: url)
            let result = try APIWheatherLoaderDataMapper.map(data, response)
            return result
        } catch let error as URLError {
            throw Error.network(error: error)
        } catch let error as DecodingError {
            throw Error.decoding(error: error)
        } catch let error as ResponseError {
            throw Error.server(error: error)
        } catch let error as Error {
            throw error
        } catch {
            throw Error.undefined(error: error)
        }
    }
    
    //MARK: - Private
    
    private func buildURL(city: String) throws -> URL {
        var urlComponents = URLComponents(string: baseUrl)!
        let parameters = ["key": apiKey,
                          "q": city,
                          "aqi": "no"]

        urlComponents.queryItems = parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }

        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        return url
    }
}
