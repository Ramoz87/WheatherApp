//
//  UserDefaultsCityRepository.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//

import Foundation

struct UserDefaultsCityRepository: CityRepository {
    
    private let key: String = "city"
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func get() -> String? {
        return userDefaults.object(forKey: key) as? String
    }
    
    func save(city: String) {
        userDefaults.set(city, forKey: key)
    }
}
