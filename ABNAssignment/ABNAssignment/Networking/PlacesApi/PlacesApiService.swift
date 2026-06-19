//
//  PlacesApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//
import Foundation

final class PlacesApiService: PlacesApi {
    private let url = URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchPlaces() async throws -> [Place] {
        guard let url else { throw PlacesAPIError.invalidURL }
        let (data, response) = try await urlSession.data(from: url)

        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw PlacesAPIError.invalidStatusCode(statusCode: -1)
        }

        guard (200...299).contains(statusCode) else {
            throw PlacesAPIError.invalidStatusCode(statusCode: statusCode)
        }

        let parsedResponse = try JSONDecoder().decode(PlacesResponse.self, from: data)
        return parsedResponse.locations
    }
}

enum PlacesAPIError: Error {
    case invalidURL
    case invalidStatusCode(statusCode: Int)
}

private struct PlacesResponse: Codable {
    let locations: [Place]
}
