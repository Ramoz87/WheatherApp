//
//  CityProtocols.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

public protocol CityGetProtocol {
    func get() -> String?
}

public protocol CitySaveProtocol {
    func save(city: String)
}
