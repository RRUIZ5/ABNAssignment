//
//  StadiumApiService.swift
//  ABNAssignment
//
//  Created by Rodrigo Ruiz Murguía on 19/06/26.
//
import Foundation

final class StadiumApiService: StadiumApi {
    private let url = URL(string: "https://raw.githubusercontent.com/RRUIZ5/ABNAssignment/refs/heads/main/ABNAssignment/BEMocks/")
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchStadiums(for country: Country) async throws -> [Stadium] {
        guard let url,
              case let url = url.appending(component: country.name).appendingPathExtension("json")
        else { throw StadiumAPIError.invalidURL }
        let (data, response) = try await urlSession.data(from: url)

        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw StadiumAPIError.invalidStatusCode(statusCode: -1)
        }

        guard (200...299).contains(statusCode) else {
            throw StadiumAPIError.invalidStatusCode(statusCode: statusCode)
        }

        return try JSONDecoder().decode([Stadium].self, from: data)
    }
}

enum StadiumAPIError: Error {
    case invalidURL
    case invalidStatusCode(statusCode: Int)
}
