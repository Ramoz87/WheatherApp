//
//  URLSessionHTTPClient.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func load(from url: URL) async throws -> (Data, URLResponse) {
        return try await session.data(from: url)
    }
}
