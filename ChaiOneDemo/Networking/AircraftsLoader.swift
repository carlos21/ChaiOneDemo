//
//  AircraftsRequest.swift
//  ChaiOneDemo
//
//  Created by Carlos Duclos on 21/01/22.
//

import Foundation
import Combine

struct AircraftsLoader: NetworkingLoader {
    
    var session = URLSession.shared
    var decoder = JSONDecoder()
    
    func loadAircrafts() -> AnyPublisher<[Aircraft], APIError> {
        let url = URL(string: "http://demo4384701.mockable.io/aircrafts")!
        return load(url: url)
    }
}
dasdadasdasdad
