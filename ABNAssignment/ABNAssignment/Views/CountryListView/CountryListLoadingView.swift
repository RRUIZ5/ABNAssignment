//
//  CountryListLoadingView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 21/06/26.
//

import SwiftUI

struct CountryListLoadingView: View {
    var body: some View {
        VStack {
            ProgressView("Loading stadiums")
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    CountryListLoadingView()
}
