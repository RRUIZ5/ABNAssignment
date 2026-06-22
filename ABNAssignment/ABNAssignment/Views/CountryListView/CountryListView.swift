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
            CountryListErrorView(viewModel: viewModel, error: error)
        case .success(let stadiumData):
            CountryListDetailView(countries: stadiumData.countries)
                .navigationDestination(for: Country.self) { country in
                    StadiumDetailView(
                        stadiums: stadiumData.stadiums[country] ?? []
                    )
                }
        }
    }
}

#Preview {
    CountryListView(viewModel: CountryListViewModel(stadiumApi: MockStadiumApi()))
}
