//
//  CountryListErrorView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 21/06/26.
//

import SwiftUI

struct CountryListErrorView: View {
    let error: Error

    var body: some View {
        Text(error.localizedDescription)
    }
}

#Preview {
    CountryListErrorView(error: StadiumAPIError.invalidURL)
}
