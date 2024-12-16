//
//  APIWheatherLoader.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

final public class APIWheatherLoader: WheatherLoader {
    private let client: HTTPClient
    private let url: URL
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load() async throws -> CityWheather {
        return CityWheather(city: "Madrid")
    }
}
