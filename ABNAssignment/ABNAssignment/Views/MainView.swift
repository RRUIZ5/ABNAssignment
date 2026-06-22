//
//  MainView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 22/06/26.
//

import SwiftUI

struct MainView: View {
    let countryListViewModel: CountryListViewModel

    var body: some View {
        TabView {
            Tab("Stadiums", systemImage: "soccerball") {
                CountryListView(viewModel: countryListViewModel)
            }
            Tab("Custom", systemImage: "mappin") {
                Text("hola")
            }
        }
    }
}

#Preview {
    MainView(countryListViewModel: CountryListViewModel(stadiumApi: MockStadiumApi()))
}
