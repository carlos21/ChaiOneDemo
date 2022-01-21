//
//  ChaiOneDemoApp.swift
//  ChaiOneDemo
//
//  Created by Carlos Duclos on 21/01/22.
//

import SwiftUI

@main
struct ChaiOneDemoApp: App {
    
    var body: some Scene {
        WindowGroup {
            AircraftsView(viewModel: makeViewModel())
        }
    }
    
    func makeViewModel() -> AircraftsViewModel {
        let loader = AircraftsLoader()
        return AircraftsViewModel(loader: loader)
    }
}
