//
//  ContentView.swift
//  ChaiOneDemo
//
//  Created by Carlos Duclos on 21/01/22.
//

import SwiftUI

struct AircraftsView: View {
    
    @ObservedObject var viewModel: AircraftsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.aircrafts) {
                AircraftRow(aircraft: $0)
            }
            .navigationTitle("Aircrafts")
            .onAppear {
                self.viewModel.load()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AircraftRow: View {
    
    var aircraft: AircraftViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(aircraft.make)
                .font(.body)
            Text(aircraft.model)
                .font(.caption)
        }
        .padding()
    }
}

