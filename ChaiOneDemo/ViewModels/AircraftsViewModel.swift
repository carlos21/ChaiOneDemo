//
//  AircraftsViewModel.swift
//  ChaiOneDemo
//
//  Created by Carlos Duclos on 21/01/22.
//

import Foundation
import Combine

class AircraftsViewModel: ObservableObject {
    
    @Published var aircrafts: [AircraftViewModel] = []
    
    private let loader: AircraftsLoader
    private var cancellables = Set<AnyCancellable>()
    
    init(loader: AircraftsLoader) {
        self.loader = loader
    }
    
    func load() {
        loader.loadAircrafts()
            .map { $0.map(AircraftViewModel.init) }
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    switch value {
                    case .failure:
                        self?.aircrafts = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] response in
                    self?.aircrafts = response
                })
            .store(in: &cancellables)
    }
}

class AircraftViewModel: Identifiable {

    let code: String
    let make: String
    let model: String
    
    var id: String {
        return code
    }
    
    init(aircraft: Aircraft) {
        self.code = aircraft.code
        self.make = aircraft.make
        self.model = aircraft.model
    }
}
