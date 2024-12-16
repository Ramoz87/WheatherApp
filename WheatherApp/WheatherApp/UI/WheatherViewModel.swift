//
//  WheatherViewModel.swift
//  WheatherApp
//
//  Created by Yury Ramazanov on 16.12.2024.
//
import Foundation

@Observable
final class WheatherViewModel {
    private let loader: WheatherLoader
    private let repository: CityRepository
    
    var search: String = ""
    var state: State = .noCity
    var alertError: Error?
    
    enum State {
        case noCity
        case selected(CityWheather)
        case search(CityWheather?)
    }
    
    struct Error: LocalizedError {
        private let internalError: LocalizedError
        
        var errorDescription: String? {
            internalError.errorDescription
        }
        var failureReason: String? {
            internalError.failureReason
        }
        
        init(_ error: Swift.Error) {
            if let localizedError = error as? LocalizedError {
                internalError = localizedError
            } else {
                internalError = UnexpectedError()
            }
        }
    }
    
    private struct UnexpectedError: LocalizedError {
        var errorDescription: String? {
            "Unexpected Error"
        }
    }
    
    init(loader: WheatherLoader, repository: CityRepository) {
        self.loader = loader
        self.repository = repository
    }
    
    func select(city: CityWheather) {
        repository.save(city: city.city)
        state = .selected(city)
    }
    
    func update() async {
        do {
            if !search.isEmpty {
                let result = try await loader.load(city: search)
                state = .search(result)
            } else if let city = repository.get() {
                let result = try await loader.load(city: city)
                state = .selected(result)
            } else {
                state = .noCity
            }
        } catch {
            alertError = Error(error)
        }
    }
}

extension WheatherViewModel {
    static func create() -> WheatherViewModel {
        let client = URLSessionHTTPClient()
        let wheatherAPI = APIWheatherLoader(client: client)
        let repository = UserDefaultsCityRepository()
        return WheatherViewModel(loader: wheatherAPI, repository: repository)
    }
}
