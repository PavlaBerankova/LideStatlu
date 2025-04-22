//
//  DataService.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

class DataService {
    static let shared = DataService()

    private init () {}

    func fetchData<AgeDataType: Codable>(from url: String) async throws -> Response<AgeDataType> {
        guard let url = URL(string: url) else {
            throw FetchError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw FetchError.invalidResponse
            }
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(Response<AgeDataType>.self, from: data)
            return decodedResponse
        } catch {
            throw FetchError.decodingFailed
        }
    }
}
