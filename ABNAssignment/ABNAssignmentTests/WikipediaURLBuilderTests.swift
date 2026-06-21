//
//  WikipediaURLBuilderTests.swift
//  ABNAssignmentTests
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

import Foundation
import Testing
@testable import ABNAssignment

@MainActor
struct WikipediaURLBuilderTests {
    let builder = WikipediaURLBuilder()

    @Test(arguments: WikipediaURLBuilderTestCase.allCases)
    func `when a valid stadium is passed then the wikipedia url is returned`(
        testCase: WikipediaURLBuilderTestCase
    ) async throws {
        let url = builder.generateWikipediaURL(for: testCase.stadium)

        #expect(url == testCase.expectedURL)
    }
}

struct WikipediaURLBuilderTestCase: CaseIterable {
    let stadium: Stadium
    let expectedURL: URL?

    static var allCases: [WikipediaURLBuilderTestCase] {
        [
            .init(
                stadium: .Mock.Mexico.azteca,
                expectedURL: URL(string: "wikipedia://places?name=Estadio Azteca&lat=19.3029&long=-99.1505")
            ),
            .init(
                stadium: .Mock.Mexico.eou,
                expectedURL: URL(string: "wikipedia://places?name=Estadio Olímpico Universitario&lat=19.3326&long=-99.1925")
            ),
            .init(
                stadium: .Mock.Mexico.jalisco,
                expectedURL: URL(string: "wikipedia://places?name=Estadio Jalisco&lat=20.705&long=-103.3288")
            ),
            .init(
                stadium: .Mock.Mexico.bbva,
                expectedURL: URL(string: "wikipedia://places?name=Estadio BBVA&lat=25.6692&long=-100.2446")
            )
        ]
    }
}
