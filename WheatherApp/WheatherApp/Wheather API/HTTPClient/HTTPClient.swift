//
//  HTTPClient.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

public protocol HTTPClient {
    func load(from url: URL) async throws -> (Data, URLResponse)
}
