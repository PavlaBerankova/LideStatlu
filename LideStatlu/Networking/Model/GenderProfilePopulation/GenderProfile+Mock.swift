//
//  AgeProfile+Mock.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

extension GenderProfile {
    static let mock: [GenderProfile] = [
        GenderProfile(
            attributes: GenderProfileAttributes(
                id: 172,
                localityCode: "583782",
                localityName: "Rosice",
                totalPopulation: 6_738,
                averageAge: 40.275601068566338,
                malePopulation: 1_342,
                maleAverageAge: 38.85342717258262,
                maleAgeGroup0to14: 681,
                maleAgeGroup15to64: 2_111,
                maleAgeGroup65plus: 476,
                femalePopulation: 3_470,
                femaleAverageAge: 41.6149855907781,
                femaleAgeGroup0to14: 661,
                femaleAgeGroup15to64: 2_122,
                femaleAgeGroup65plus: 687
            )
        ),
        GenderProfile(
            attributes: GenderProfileAttributes(
                id: 184,
                localityCode: "582786",
                localityName: "Brno",
                totalPopulation: 400_566,
                averageAge: 42.582852763339872,
                malePopulation: 194_046,
                maleAverageAge: 40.813245312967027,
                maleAgeGroup0to14: 32_071,
                maleAgeGroup15to64: 128_749,
                maleAgeGroup65plus: 33_226,
                femalePopulation: 206_520,
                femaleAverageAge: 44.245574278520237,
                femaleAgeGroup0to14: 30_542,
                femaleAgeGroup15to64: 127_318,
                femaleAgeGroup65plus: 48_660
            )
        ),
        GenderProfile(
            attributes: GenderProfileAttributes(
                id: 77,
                localityCode: "583481",
                localityName: "Neslovice",
                totalPopulation: 994,
                averageAge: 39.766599597585511,
                malePopulation: 490,
                maleAverageAge: 38.922448979591834,
                maleAgeGroup0to14: 94,
                maleAgeGroup15to64: 336,
                maleAgeGroup65plus: 60,
                femalePopulation: 504,
                femaleAverageAge: 40.587301587301589,
                femaleAgeGroup0to14: 93,
                femaleAgeGroup15to64: 330,
                femaleAgeGroup65plus: 81
            )
        )
    ]
}
