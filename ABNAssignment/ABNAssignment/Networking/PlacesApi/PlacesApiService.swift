//
//  PlacesApi.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//
import Foundation

final class PlacesApiService: PlacesApi {
    private let url = URL(string: "https://raw.githubusercontent.com/RRUIZ5/ABNAssignment/refs/heads/main/ABNAssignment/BEMocks/")
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchPlaces(for country: Country) async throws -> [Place] {
        guard let url,
              case let url = url.appending(component: country.name).appendingPathExtension("json")
        else { throw PlacesAPIError.invalidURL }
        print(url)
        let (data, response) = try await urlSession.data(from: url)

        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw PlacesAPIError.invalidStatusCode(statusCode: -1)
        }

        guard (200...299).contains(statusCode) else {
            throw PlacesAPIError.invalidStatusCode(statusCode: statusCode)
        }

        return try JSONDecoder().decode([Place].self, from: data)
    }
}

enum PlacesAPIError: Error {
    case invalidURL
    case invalidStatusCode(statusCode: Int)
}
