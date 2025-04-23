//
//  AgeStructureData.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

struct AgeStructAttributes: Codable {
    let id: Int
    let localityCode: String
    let localityName: String
    let district: String

    let totalPopulation: Int?
    let age0to4: Int?
    let age5to9: Int?
    let age10to14: Int?
    let age15to19: Int?
    let age20to24: Int?
    let age25to29: Int?
    let age30to34: Int?
    let age35to39: Int?
    let age40to44: Int?
    let age45to49: Int?
    let age50to54: Int?
    let age55to59: Int?
    let age60to64: Int?
    let age65to69: Int?
    let age70to74: Int?
    let age75to79: Int?
    let age80to84: Int?
    let age85to89: Int?
    let age90plus: Int?
    let ageIndex: Double?

    enum CodingKeys: String, CodingKey {
        case id = "OBJECTID_1"
        case localityCode = "KOD_OBEC"
        case localityName = "NAZ_OBEC"
        case district = "NAZ_LAU1"
        case totalPopulation = "Celkem"

        case age0to4 = "F0_4"
        case age5to9 = "F5_9"
        case age10to14 = "F10_14"
        case age15to19 = "F15_19"
        case age20to24 = "F20_24"
        case age25to29 = "F25_29"
        case age30to34 = "F30_34"
        case age35to39 = "F35_39"
        case age40to44 = "F40_44"
        case age45to49 = "F45_49"
        case age50to54 = "F50_54"
        case age55to59 = "F55_59"
        case age60to64 = "F60_64"
        case age65to69 = "F65_69"
        case age70to74 = "F70_74"
        case age75to79 = "F75_79"
        case age80to84 = "F80_84"
        case age85to89 = "F85_89"
        case age90plus = "F90_"
        case ageIndex = "Index_stáří"
    }
}

extension AgeStructAttributes {
    func populationAgeGroup(by userAge: Int) -> (Int?, String?) {
        switch userAge {
        case 0...4:
            return (age0to4, "(0–4 roky)")
        case 5...9:
            return (age5to9, "(5–9 let)")
        case 10...14:
            return (age10to14, "(10–14 let)")
        case 15...19:
            return (age15to19, "(15–19 let)")
        case 20...24:
            return (age20to24, "(20–24 let)")
        case 25...29:
            return (age25to29, "(25-29 let)")
        case 30...34:
            return (age30to34, "(30–34 let)")
        case 35...39:
            return (age35to39, "(35–39 let)")
        case 40...44:
            return (age40to44, "(40-44 let)")
        case 45...49:
            return (age45to49, "(45–49 let)")
        case 50...54:
            return (age50to54, "(50–54 let)")
        case 55...59:
            return (age55to59, "(55-59 let)")
        case 60...64:
            return (age60to64, "(60–64 let)")
        case 65...69:
            return (age65to69, "(65–69 let)")
        case 70...74:
            return (age70to74, "(70-74 let)")
        case 75...79:
            return (age75to79, "(75–79 let)")
        case 80...84:
            return (age80to84, "(80–84 let)")
        case 85...89:
            return (age85to89, "(85-89 let)")
        case 90...:
            return (age90plus, "(90+ let)")
        default:
            return (nil, nil)
        }
    }
}
