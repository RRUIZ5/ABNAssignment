//
//  StadiumManager.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 21/06/26.
//

import Foundation
import Observation

@Observable
final class StadiumViewModel {
    var state: StadiumViewModelState

    private let placesApi: PlacesApi

    init(
        placesApi: PlacesApi = PlacesApiService()
    ) {
        self.placesApi = placesApi
        state = .idle
    }

    func fetchStadiums() async {
        state = .loading
        do {
            let stadiums = try await loadStadiums()
            state = .success(stadiums: StadiumData(stadiums: stadiums))
        } catch {
            state = .failed(error: error)
        }
    }

    private func loadStadiums() async throws -> [Country: [Place]] {
        try await withThrowingTaskGroup(of: [Place].self) { group in
            for country in Country.allCases {
                group.addTask {
                    try await self.placesApi.fetchPlaces(for: country)
                }
            }

            var allPlaces: [Place] = []
            for try await places in group {
                allPlaces.append(contentsOf: places)
            }

            return Dictionary(grouping: allPlaces) { place in
                place.country
            }
        }
    }
}

enum StadiumViewModelState {
    case idle
    case loading
    case failed(error: Error)
    case success(stadiums: StadiumData)
}

struct StadiumData {
    let stadiums: [Country: [Place]]
    var countries: [Country] { Array(stadiums.keys.sorted()) }

    init(stadiums: [Country : [Place]]) {
        self.stadiums = stadiums
    }
}
