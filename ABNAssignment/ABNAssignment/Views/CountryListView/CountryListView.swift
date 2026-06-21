//
//  ContentView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

import SwiftUI

struct CountryListView: View {
    let viewModel: StadiumViewModel

    var body: some View {
        NavigationStack {
            content
            .navigationTitle("ABNAmro assignment")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Country.self) { country in
                Text("hola?")
            }
        }.task {
            await viewModel.fetchStadiums()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle:
            Text("Welcome")
        case .loading:
            VStack {
                Text("Loading stadiums")
                ProgressView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        case .failed(let error):
            Text(error.localizedDescription)
        case .success(let stadiums):
            Text("Select a country")
            List(stadiums.countries) { country in
                NavigationLink("\(country.emoji) \(country.name)", value: country)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    CountryListView(viewModel: StadiumViewModel(stadiumApi: MockStadiumApi()))
}
