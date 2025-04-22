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

    private var userGeneration: some View {
        TextResultRowView(
            title: "Patříš do generace",
            result: state.userGenerationTitle,
            subTitle: state.userGenerationYearRange
        )
    }

    private var userLocalityTotalPopulation: some View {
        TextResultRowView(
            title: "Žije zde celkem",
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
            result: state.ageIndex,
            subTitle: "Index menší než 100 - mladá populace\nIndex větší než 100 - stárnoucí populace")
    }
}

#Preview {
    GenerationResultView(state: GenerationResultViewModel(appState: AppState()))
}
