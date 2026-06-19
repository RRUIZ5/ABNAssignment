//
//  Place.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

struct Place: Identifiable, Codable {
    let name: String
    let latitude: Double
    let longitude: Double
    let country: Country

    var id: String { name }
}
