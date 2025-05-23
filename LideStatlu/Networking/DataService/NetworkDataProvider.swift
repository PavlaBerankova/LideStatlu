//
//  NetworkDataProvider.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 24.04.2025.
//

import Foundation

class NetworkDataProvider: DataProvider {
    let ageStructureUrl = APIEndpoint.ageStructure.urlString
    let genderProfileUrl = APIEndpoint.genderProfile.urlString

    func fetchAgeStructureData() async throws -> [AgeStructure] {
        let response: Response<AgeStructure> = try await fetchData(from: ageStructureUrl)
        return response.features
    }

    func fetchGenderProfileData() async throws -> [GenderProfile] {
        let response: Response<GenderProfile> = try await fetchData(from: genderProfileUrl)
        return response.features
    }

    private func fetchData<T: Codable>(from url: String) async throws -> Response<T> {
        guard let url = URL(string: url) else {
            throw FetchError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw FetchError.invalidResponse
            }
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(Response<T>.self, from: data)
            return decodedResponse
        } catch {
            throw FetchError.decodingFailed
        }
    }
}
