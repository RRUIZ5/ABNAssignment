//
//  MockPlacesApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//


final class MockPlacesApi: PlacesApi {
    func fetchPlaces(for country: Country) async throws -> [Place] {
        [
            Place(name: "Estadio Azteca", latitude: 19.3029, longitude: -99.1505, country: .mexico),
            Place(name: "Estadio Olímpico Universitario", latitude: 19.3326, longitude: -99.1925, country: .mexico),
            Place(name: "Estadio BBVA", latitude: 25.6692, longitude: -100.2446, country: .mexico),
            Place(name: "Estadio Jalisco", latitude: 20.7050, longitude: -103.3288, country: .mexico)
        ]
    }
}
