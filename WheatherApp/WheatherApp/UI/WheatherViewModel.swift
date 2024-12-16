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
    
    enum Error: LocalizedError {
        case undefined
        case data(LocalizedError)
      
        var errorDescription: String? {
            "Error"
        }
       
        var failureReason: String? {
            switch self {
            case .undefined: return "Undefined Error"
            case let .data(error): return error.failureReason
            }
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
        } catch let error as LocalizedError{
            alertError = .data(error)
        } catch {
            alertError = .undefined
        }
    }
}

extension APIWheatherLoader.Error: LocalizedError {
    public var failureReason: String? {
        switch self {
        case let .server(error): return error.message
        case .invalidResponse: return "Invalid response"
        case let .network(error): return error.localizedDescription
        case let .decoding(error): return error.localizedDescription
        case let .undefined(error): return error.localizedDescription
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
