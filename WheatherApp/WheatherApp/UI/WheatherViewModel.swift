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
    
    init(loader: WheatherLoader) {
        self.loader = loader
    }
    
    func update() async {
        do {
            if search.isEmpty { return }
            let result = try await loader.load(city: search)
            state = .selected(result)
        } catch {
            alertError = Error(error)
        }
    }
    
    //MARK: - Private
}

extension WheatherViewModel {
    static func create() -> WheatherViewModel {
        let client = URLSessionHTTPClient()
        let wheatherAPI = APIWheatherLoader(client: client)
        return WheatherViewModel(loader: wheatherAPI)
    }
}
