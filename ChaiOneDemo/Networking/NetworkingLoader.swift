//
//  Loader.swift
//  ChaiOneDemo
//
//  Created by Carlos Duclos on 21/01/22.
//

import Foundation
import Combine

protocol NetworkingLoader {
    
    var session: URLSession { get set }
    var decoder: JSONDecoder { get set }
}

extension NetworkingLoader {
    
    func load<Response: Decodable>(url: URL) -> AnyPublisher<Response, APIError> {
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .mapError { _ in .network }
            .flatMap {
                decode($0)
            }
            .eraseToAnyPublisher()
    }
    
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
        let decoder = JSONDecoder()
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { _ in .parsing }
            .eraseToAnyPublisher()
    }
}
