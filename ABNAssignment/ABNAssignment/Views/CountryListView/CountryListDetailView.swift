//
//  CountryListDetailView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 21/06/26.
//

import SwiftUI

struct CountryListDetailView: View {
    let countries: [Country]

    var body: some View {
        Text("Select a country")
        List(countries) { country in
            NavigationLink("\(country.emoji) \(country.name)", value: country)
                .accessibilityLabel(country.name)
                .accessibilityHint("Shows stadiums in \(country.name)")
                .accessibilityIdentifier("country_\(country.name)")
        }
        .listStyle(.plain)
    }
}

#Preview {
    CountryListDetailView(countries: Country.allCases)
}
