//
//  MockStadiumApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//


final class MockStadiumApi: StadiumApi {
    func fetchStadiums(for country: Country) async throws -> [Stadium] {
        [
            Stadium(name: "Estadio Azteca", latitude: 19.3029, longitude: -99.1505, country: .mexico),
            Stadium(name: "Estadio Olímpico Universitario", latitude: 19.3326, longitude: -99.1925, country: .mexico),
            Stadium(name: "Estadio BBVA", latitude: 25.6692, longitude: -100.2446, country: .mexico),
            Stadium(name: "Estadio Jalisco", latitude: 20.7050, longitude: -103.3288, country: .mexico)
        ]
    }
}
