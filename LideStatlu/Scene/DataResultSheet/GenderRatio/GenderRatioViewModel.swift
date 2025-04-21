//
//  GenderRatioViewModel.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 21.04.2025.
//

import Foundation

@MainActor
class GenderRatioViewModel: ObservableObject {
    private var appState: AppState

    init(appState: AppState) {
        self.appState = appState
    }

    var selectedLocality: Locality {
        appState.selectedLocality
    }

    var femalePopulation: String {
        if let femaleCount = appState.filteredProfileData?.attributes.femalePopulation {
            let formattedFemaleCount = femaleCount.formattedWithSeparator()
            return formattedFemaleCount + " žen"
        }
        return "-"
    }

    var malePopulation: String {
        if let maleCount = appState.filteredProfileData?.attributes.malePopulation {
            let formattedMaleCount = maleCount.formattedWithSeparator()
            return formattedMaleCount + " mužů"
        }
        return "_"
    }

    var femaleAverageAge: String {
        if let femaleAverageAge = appState.filteredProfileData?.attributes.femaleAverageAge {
            return String(Int(femaleAverageAge)) + " let"
        }
        return "-"
    }

    var maleAverageAge: String {
        if let maleAverageAge = appState.filteredProfileData?.attributes.maleAverageAge {
            return  String(Int(maleAverageAge)) + " let"
        }
        return "-"
    }

    var totalAverageAge: String {
        if let allAverageAge = appState.filteredProfileData?.attributes.averageAge {
            return String(Int(allAverageAge)) + " let"
        }
        return "-"
    }

    func tryAgainButtonTapped() {
        appState.resetQueryForm()
    }
}
