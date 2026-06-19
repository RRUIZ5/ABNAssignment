//
//  MockPlacesApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//


final class MockPlacesApi: PlacesApi {
    func fetchPlaces() async throws -> [Place] {
        [
            Place(name: "Amsterdam", latitude: 52.3547498, longitude: 4.8339215),
            Place(name: "Mumbai", latitude: 19.0823998, longitude: 72.8111468),
            Place(name: "Copenhagen", latitude: 55.6713442, longitude: 12.523785),
            Place(name: nil, latitude: 40.4380638, longitude: -3.7495758)
        ]
    }
}