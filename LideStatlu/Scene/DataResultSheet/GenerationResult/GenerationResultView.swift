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
        VStack(alignment: .center) {
            localityName
            userGeneration
            Divider()
            headerRow
            userLocalityTotalPopulation
            userAgeGroupPopulation
            ageIndex
        }
        .padding([.horizontal, .top])
        Spacer()
    }
}

extension GenerationResultView {
    private var localityName: some View {
        Text(state.selectedLocality.name)
            .resultViewTitleStyle()
    }

    private var headerRow: some View {
        HeaderResultView(title: "Struktura obyvatel")
    }

    private var userGeneration: some View {
        TextResultRowView(
            title: "Je ti \(state.userAge) let a patříš do generace",
            result: state.userGenerationTitle,
            subTitle: state.userGenerationYearRange
        )
    }

    private var userLocalityTotalPopulation: some View {
        TextResultRowView(
            title: "Obec má celkem",
            result: state.filteredAndFormattedPopulationData + " obyvatel",
            subTitle: nil
        )
    }

    private var userAgeGroupPopulation: some View {
        TextResultRowView(
            title: "Z toho je ve tvé věkové skupině",
            result: state.populationByUserAgeGroup.0 + " obyvatel",
            subTitle: state.populationByUserAgeGroup.1
        )
    }

    private var ageIndex: some View {
        TextResultRowView(
            title: "Index stáří",
            result: state.ageIndex,
            subTitle: "Index menší než 100 - mladá populace\nIndex větší než 100 - stárnoucí populace")
    }
}

#Preview {
    GenerationResultView(state: GenerationResultViewModel(appState: AppState()))
}
