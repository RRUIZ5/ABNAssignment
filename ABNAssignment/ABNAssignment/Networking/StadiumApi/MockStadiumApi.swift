//
//  MockStadiumApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

final class MockStadiumApi: StadiumApi {
    func fetchStadiums(for country: Country) async throws -> [Stadium] {
        [
            .Mock.Mexico.azteca,
            .Mock.Mexico.bbva,
            .Mock.Mexico.eou,
            .Mock.Mexico.jalisco
        ]
    }
}
