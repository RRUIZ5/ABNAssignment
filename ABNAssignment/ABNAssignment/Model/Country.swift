//
//  Country.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//
enum Country: String, Codable, CaseIterable {
    case mexico = "mx"
    case brasil = "br"
    case argentina = "ar"
    case england = "en"
    case spain = "sp"
    case germany = "de"

    var name: String {
        switch self {
        case .mexico: "Mexico"
        case .brasil: "Brasil"
        case .argentina: "Argentina"
        case .england: "England"
        case .spain: "Spain"
        case .germany: "Germany"
        }
    }

    var emoji: String {
        switch self {
        case .mexico: "🇲🇽"
        case .brasil: "🇧🇷"
        case .argentina: "🇦🇷"
        case .england: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"
        case .spain: "🇪🇸"
        case .germany: "🇩🇪"
        }
    }
}
