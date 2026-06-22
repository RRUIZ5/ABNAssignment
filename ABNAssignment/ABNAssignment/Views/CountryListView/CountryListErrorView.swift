//
//  CountryListErrorView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 21/06/26.
//

import SwiftUI

struct CountryListErrorView: View {
    let viewModel: CountryListViewModel
    let error: Error

    var body: some View {
        VStack {
            Text(error.localizedDescription)
            Button("Try again") {
                Task {
                    await viewModel.fetchStadiums()
                }
            }
        }
    }
}

#Preview {
    CountryListErrorView(
        viewModel: CountryListViewModel(
            stadiumApi: MockStadiumApi()
        ),
        error: StadiumAPIError.invalidURL
    )
}
