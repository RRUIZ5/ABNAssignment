//
//  CountryListViewModel.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 21/06/26.
//

import Foundation
import Observation

@Observable
final class CountryListViewModel {
    var state: StadiumViewModelState

    private let stadiumApi: StadiumApi

    init(
        stadiumApi: StadiumApi = StadiumApiService()
    ) {
        self.stadiumApi = stadiumApi
        state = .idle
    }

    func fetchStadiums() async {
        state = .loading
        do {
            let stadiums = try await loadStadiums()
            state = .success(stadiumData: StadiumData(stadiums: stadiums))
        } catch {
            state = .failed(error: error)
        }
    }

    private func loadStadiums() async throws -> [Country: [Stadium]] {
        try await withThrowingTaskGroup(of: [Stadium].self) { group in
            for country in Country.allCases {
                group.addTask {
                    try await self.stadiumApi.fetchStadiums(for: country)
                }
            }

            var allStadiums: [Stadium] = []
            for try await stadiums in group {
                allStadiums.append(contentsOf: stadiums)
            }

            return Dictionary(grouping: allStadiums) { stadium in
                stadium.country
            }
        }
    }
}

enum StadiumViewModelState {
    case idle
    case loading
    case failed(error: Error)
    case success(stadiumData: StadiumData)
}

struct StadiumData {
    let stadiums: [Country: [Stadium]]
    var countries: [Country] { Array(stadiums.keys.sorted()) }

    init(stadiums: [Country : [Stadium]]) {
        self.stadiums = stadiums
    }
}
