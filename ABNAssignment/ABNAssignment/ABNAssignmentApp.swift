//
//  ABNAssignmentApp.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//

import SwiftUI

@main
struct ABNAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListView(viewModel: StadiumViewModel())
        }
    }
}
