//
//  AgeProfileAttributes.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

struct GenderProfileAttributes: Codable {
    let id: Int
    let localityCode: String
    let localityName: String

    // All population
    let totalPopulation: Int?
    let averageAge: Double?

    // Male population
    let malePopulation: Int?
    let maleAverageAge: Double?
    let maleAgeGroup0to14: Int?
    let maleAgeGroup15to64: Int?
    let maleAgeGroup65plus: Int?

    // Female population
    let femalePopulation: Int?
    let femaleAverageAge: Double?
    let femaleAgeGroup0to14: Int?
    let femaleAgeGroup15to64: Int?
    let femaleAgeGroup65plus: Int?

    enum CodingKeys: String, CodingKey {
        case id = "OBJECTID"
        case localityCode = "KOD_OBEC"
        case localityName = "NAZ_OBEC"

        // All population
        case totalPopulation = "Celkem"
        case averageAge = "Průměrný_věk"

        // Male population
        case malePopulation = "Muži"
        case maleAverageAge = "Průměrný_věk1"
        case maleAgeGroup0to14 = "F0_141"
        case maleAgeGroup15to64 = "F15_641"
        case maleAgeGroup65plus = "F65_a_vice1"

        // Female population
        case femalePopulation = "Ženy"
        case femaleAverageAge = "Průměrný_věk2"
        case femaleAgeGroup0to14 = "F0_142"
        case femaleAgeGroup15to64 = "F15_642"
        case femaleAgeGroup65plus = "F65_a_vice2"
    }
}
