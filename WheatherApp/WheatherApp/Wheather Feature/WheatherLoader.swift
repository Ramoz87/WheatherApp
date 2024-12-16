//
//  WheatherLoader.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

public protocol WheatherLoader {
    func load(city: String) async throws -> CityWheather
}
