//
//  DataService.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

class MockDataProvider: DataProvider {
    func fetchAgeStructureData() async throws -> [AgeStructure] {
        try await Task.sleep(nanoseconds: 500_000_000)
        return AgeStructure.mock
    }

    func fetchGenderProfileData() async throws -> [GenderProfile] {
        try await Task.sleep(nanoseconds: 500_000_000)
        return GenderProfile.mock
    }
}
