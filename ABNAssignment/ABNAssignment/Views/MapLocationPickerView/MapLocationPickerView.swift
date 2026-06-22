//
//  MapLocationPickerView.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 22/06/26.
//

import MapKit
import SwiftUI

struct MapLocationPickerView: View {
    @State private var selectedPlace: Place?
    private let wikipediaManger = WikipediaManager()

    var body: some View {
        ZStack(alignment: .topTrailing) {
            MapReader { reader in
                Map() {
                    if let selectedPlace {
                        Marker("", coordinate: selectedPlace.coordinate)
                    }
                }.onTapGesture(perform: { screenCoord in
                    guard let coordinate = reader.convert(screenCoord, from: .local) else { return }
                    selectedPlace = Place(coordinate: coordinate)
                })
            }
            if let selectedPlace {
                Button("Go to wikipedia") {
                    wikipediaManger.openWikipedia(for: selectedPlace)
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(radius: 4)
                .padding()
            }
        }
    }
}

#Preview {
    MapLocationPickerView()
}
