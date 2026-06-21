//
//  StadiumApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

protocol StadiumApi: Sendable {
    func fetchStadiums(for country: Country) async throws -> [Stadium]
}
