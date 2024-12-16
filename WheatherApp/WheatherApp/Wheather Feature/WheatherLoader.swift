//
//  WheatherLoader.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

public protocol WheatherLoader {
    func load() async throws -> CityWheather
}
