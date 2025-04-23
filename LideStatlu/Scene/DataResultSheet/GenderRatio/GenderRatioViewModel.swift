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

    var femaleGroup0to14: String {
        if let female0to14 = appState.filteredProfileData?.attributes.femaleAgeGroup0to14 {
            return female0to14.formattedWithSeparator()
        }
        return "-"
    }

    var femaleGroup15to64: String {
        if let female15to64 = appState.filteredProfileData?.attributes.femaleAgeGroup15to64 {
            return female15to64.formattedWithSeparator()
        }
        return "-"
    }

    var femaleGroup65plus: String {
        if let female65plus = appState.filteredProfileData?.attributes.femaleAgeGroup65plus {
            return female65plus.formattedWithSeparator()
        }
        return "-"
    }

    var maleGroup0to14: String {
        if let male0to14 = appState.filteredProfileData?.attributes.maleAgeGroup0to14 {
            return male0to14.formattedWithSeparator()
        }
        return "-"
    }

    var maleGroup15to64: String {
        if let male15to64 = appState.filteredProfileData?.attributes.maleAgeGroup15to64 {
            return male15to64.formattedWithSeparator()
        }
        return "-"
    }

    var maleGroup65plus: String {
        if let male65plus = appState.filteredProfileData?.attributes.maleAgeGroup65plus {
            return male65plus.formattedWithSeparator()
        }
        return "-"
    }

    func tryAgainButtonTapped() {
        appState.backToQueryForm()
    }
}
