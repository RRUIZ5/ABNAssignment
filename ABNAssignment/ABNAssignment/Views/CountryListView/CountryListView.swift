//
//  ContentView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

import SwiftUI

struct CountryListView: View {
    @State private var isEmpty = false
    var body: some View {
        NavigationStack {
            content
            .navigationTitle("ABNAmro assignment")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Country.self) { country in
                Text("hola?")
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        if isEmpty {
            VStack {
                Text("Loading places")
                ProgressView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        } else {
            Text("Select a country")
            List(Country.allCases) { country in
                NavigationLink("\(country.emoji) \(country.name)", value: country)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    CountryListView()
}
