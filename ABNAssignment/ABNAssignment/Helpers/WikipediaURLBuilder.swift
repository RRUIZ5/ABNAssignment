//
//  WikipediaURLBuilder.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 22/06/26.
//

import Foundation

final class WikipediaURLBuilder {
    func generateWikipediaURL(for stadium: Stadium) -> URL? {
        var components = URLComponents()
        components.scheme = "wikipedia"
        components.host = "places"
        components.queryItems = [
            URLQueryItem(name: "name", value: stadium.name),
            URLQueryItem(name: "lat", value: String(stadium.latitude)),
            URLQueryItem(name: "long", value: (String(stadium.longitude)))
        ]

        return components.url
    }
}
