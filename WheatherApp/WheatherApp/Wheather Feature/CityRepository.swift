//
//  WheatherStorage.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

public protocol CityRepository {
    func get() -> String?
    func save(city: String)
}
