//
//  StadiumDetailView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 21/06/26.
//

import SwiftUI

struct StadiumDetailView: View {
    let stadiums: [Stadium]
    private let wikipediaManger = WikipediaManager()

    var body: some View {
        List(stadiums) { stadium in
            HStack {
                Text(stadium.country.emoji)
                Text(stadium.name)
            }
            .onTapGesture {
                wikipediaManger.openWikipedia(for: stadium)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    StadiumDetailView(stadiums: Stadium.Mock.Mexico.allCases)
}
