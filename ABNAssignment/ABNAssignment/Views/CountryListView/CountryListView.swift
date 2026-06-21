//
//  ContentView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

import SwiftUI

struct CountryListView: View {
    let viewModel: CountryListViewModel

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
            CountryListIdleView()
        case .loading:
            CountryListLoadingView()
        case .failed(let error):
            CountryListErrorView(error: error)
        case .success(let stadiums):
            CountryListDetailView(countries: stadiums.countries)
        }
    }
}

#Preview {
    CountryListView(viewModel: CountryListViewModel(stadiumApi: MockStadiumApi()))
}
