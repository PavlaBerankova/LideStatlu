//
//  GenerationResultViewModel.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

@MainActor
class GenerationResultViewModel: ObservableObject {
    private var appState: AppState

    init(appState: AppState, userGeneration: Generation? = nil) {
        self.appState = appState
        self.userGeneration = userGeneration
    }

    @Published var userGeneration: Generation?

    var userYearOfBirth: Int {
        appState.userYearOfBirth
    }

    var userAge: Int {
        appState.getUserAgeByYearOfBirth()
    }

    var selectedLocality: Locality {
        appState.selectedLocality
    }

    var userGenerationTitle: String {
        getUserGeneration().title
    }

    var userGenerationYearRange: String {
        getUserGeneration().yearRange
    }

    var filteredAndFormattedPopulationData: String {
        appState.filteredStructureData?.attributes.totalPopulation?.formattedWithSeparator() ?? "-"
    }

    var populationByUserAgeGroup: String {
        let populationAgeGroup = appState.filteredStructureData?.attributes.getPopulation(by: userAge)
        return populationAgeGroup?.formattedWithSeparator() ?? "-"
    }

    func getUserGeneration() -> Generation {
        switch userYearOfBirth {
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
