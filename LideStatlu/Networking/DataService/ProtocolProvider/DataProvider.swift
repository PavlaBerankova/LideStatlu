//
//  DataProvider.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 24.04.2025.
//

import Foundation

protocol DataProvider {
    func fetchAgeStructureData() async throws -> [AgeStructure]
    func fetchAgeProfileData() async throws -> [GenderProfile]
}
