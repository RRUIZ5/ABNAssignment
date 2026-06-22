//
//  CountryListViewModelTests.swift
//  ABNAssignmentTests
//
//  Created by Rodrigo Ruiz Murguía on 22/06/26.
//

@testable import ABNAssignment
import Testing
import Observation

struct CountryListViewModelTests {
    let viewModel = CountryListViewModel(stadiumApi: MockStadiumApi())

    @Test
    func `when api returns a valid response then the viewModel has a success state`() async throws {
        var iterator = viewModel.stateStream.makeAsyncIterator()
        await viewModel.fetchStadiums()
        let firstState = try await #require(iterator.next())
        let secondState = try await #require(iterator.next())
        let thirdState = try await #require(iterator.next())

        #expect(firstState == .idle)
        #expect(secondState == .loading)
        // parameters of .success are ignored in Equatable
        #expect(thirdState == .success(stadiumData: StadiumData(stadiums: [:])))
    }
}

extension CountryListViewModel {
    var stateStream: AsyncStream<StadiumViewModelState> {
        AsyncStream { continuation in
            @MainActor func observe() {
                let currentState = withObservationTracking {
                    self.state
                } onChange: {
                    Task { @MainActor in
                        observe()
                    }
                }
                continuation.yield(currentState)
            }

            observe()
        }
    }
}
