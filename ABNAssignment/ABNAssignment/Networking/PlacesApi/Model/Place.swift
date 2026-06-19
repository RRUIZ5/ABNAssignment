//
//  Place.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

struct Place: Codable {
    let name: String?
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "long"
    }
}
