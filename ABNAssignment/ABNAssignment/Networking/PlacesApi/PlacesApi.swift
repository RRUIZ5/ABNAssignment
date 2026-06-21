//
//  PlacesApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

protocol PlacesApi: Sendable {
    func fetchPlaces(for country: Country) async throws -> [Place]
}
