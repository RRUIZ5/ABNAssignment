//
//  Place.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 22/06/26.
//

import Foundation
import CoreLocation

struct Place {
    var name: String
    var coordinate: CLLocationCoordinate2D

    init(name: String? = nil, coordinate: CLLocationCoordinate2D) {
        self.name = name ?? ""
        self.coordinate = coordinate
    }
}

extension Place: WikipediaURLBuildable {
    var latitude: Double { coordinate.latitude }
    var longitude: Double { coordinate.longitude }
}
