//
//  ContentView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            let api = PlacesApiService()
            for country in Country.allCases {
                let places = try! await api.fetchPlaces(for: country)
                print(places)
                print("nada")
            }
        }
    }
}

#Preview {
    ContentView()
}
