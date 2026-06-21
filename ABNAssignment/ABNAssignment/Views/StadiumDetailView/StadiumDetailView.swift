//
//  StadiumDetailView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 21/06/26.
//

import SwiftUI

struct StadiumDetailView: View {
    let stadiums: [Stadium]

    var body: some View {
        List(stadiums) { stadium in
            HStack {
                Text(stadium.country.emoji)
                Text(stadium.name)
            }
        }
        .listStyle(.plain)
        .onTapGesture {
            print("hola?")
        }
    }
}

#Preview {
    StadiumDetailView(stadiums: Stadium.Mock.Mexico.allCases)
}
