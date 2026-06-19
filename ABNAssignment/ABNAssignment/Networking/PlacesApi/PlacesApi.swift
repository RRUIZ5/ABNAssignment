//
//  PlacesApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

protocol PlacesApi {
    func fetchPlaces(for country: Country) async throws -> [Place]
}
