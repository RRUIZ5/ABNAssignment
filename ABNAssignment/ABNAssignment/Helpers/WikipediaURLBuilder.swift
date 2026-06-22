//
//  WikipediaURLBuilder.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 22/06/26.
//

import Foundation

final class WikipediaURLBuilder {
    func generateWikipediaURL(for model: WikipediaURLBuildable) -> URL? {
        var components = URLComponents()
        components.scheme = "wikipedia"
        components.host = "places"
        components.queryItems = [
            URLQueryItem(name: "name", value: model.name),
            URLQueryItem(name: "lat", value: String(model.latitude)),
            URLQueryItem(name: "long", value: (String(model.longitude)))
        ]

        return components.url
    }
}
