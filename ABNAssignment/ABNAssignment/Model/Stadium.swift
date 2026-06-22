//
//  Stadium.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

struct Stadium: Identifiable, Codable, Equatable {
    let name: String
    let latitude: Double
    let longitude: Double
    let country: Country

    var id: String { name }
}

extension Stadium {
    enum Mock {
        enum Mexico {
            nonisolated static let azteca = Stadium(
                name: "Estadio Azteca",
                latitude: 19.3029,
                longitude: -99.1505,
                country: .mexico
            )
            nonisolated static let eou = Stadium(
                name: "Estadio Olímpico Universitario",
                latitude: 19.3326,
                longitude: -99.1925,
                country: .mexico
            )
            nonisolated static let bbva = Stadium(
                name: "Estadio BBVA",
                latitude: 25.6692,
                longitude: -100.2446,
                country: .mexico
            )
            nonisolated static let jalisco = Stadium(
                name: "Estadio Jalisco",
                latitude: 20.7050,
                longitude: -103.3288,
                country: .mexico
            )

            nonisolated static var allCases: [Stadium] {
                [
                    .Mock.Mexico.azteca,
                    .Mock.Mexico.eou,
                    .Mock.Mexico.bbva,
                    .Mock.Mexico.jalisco
                ]
            }
        }
    }
}
