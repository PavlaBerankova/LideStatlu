//
//  GenerationResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct GenerationResultView: View {
    @ObservedObject var state: GenerationResultViewModel

    var body: some View {
        VStack {
            userGeneration
            userLocalityTotalPopulation
            userAgeGroupPopulation
            ageIndex
        }
        .padding(.horizontal)
        .navigationTitle(state.selectedLocality.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension GenerationResultView {
    private var userGeneration: some View {
        TextResultRowView(
            title: "Patříš do generace",
            result: state.userGenerationTitle,
            subTitle: state.userGenerationYearRange
        )
    }

    private var userLocalityTotalPopulation: some View {
        TextResultRowView(
            title: "V obci \(state.selectedLocality.name) žije celkem",
            result: state.filteredAndFormattedPopulationData + " obyvatel",
            subTitle: nil
        )
    }

    private var userAgeGroupPopulation: some View {
        TextResultRowView(
            title: "Z toho je ve tvé věkové kategorii",
            result: state.populationByUserAgeGroup + " obyvatel",
            subTitle: nil
        )
    }

    private var ageIndex: some View {
        TextResultRowView(
            title: "Index stáří",
            result: "132",
            subTitle: "Index menší než 100 - mladá populace\nIndex větší než 100 - stárnoucí populace")
    }
}

#Preview {
    GenerationResultView(state: GenerationResultViewModel(appState: AppState()))
}
