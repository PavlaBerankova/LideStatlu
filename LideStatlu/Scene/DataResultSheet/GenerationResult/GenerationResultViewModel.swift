//
//  GenerationResultViewModel.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

@MainActor
class GenerationResultViewModel: ObservableObject {
    @Published var userGeneration: Generation?

    func getUserGeneration(by year: Int) -> Generation {
        switch year {
        case 1_925...1_945:
            return .genSilent
        case 1_946...1_964:
            return .genBabyBoomers
        case 1_965...1_979:
            return .genX
        case 1_980...1_994:
            return .genY
        case 1_995...2_012:
            return .genZ
        case 2_013...Calendar.current.component(.year, from: Date()):
            return .genAlpha
        default:
            return .none
        }
    }
}
