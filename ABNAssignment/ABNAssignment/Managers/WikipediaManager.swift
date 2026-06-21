//
//  WikipediaManager.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 22/06/26.
//

import UIKit

final class WikipediaManager {

    init() {}

    func openWikipedia(for stadium: Stadium) {
        let builder = WikipediaURLBuilder()
        guard let url = builder.generateWikipediaURL(for: stadium) else { return }
        UIApplication.shared.open(url)
    }
}
