//
//  GenerationResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct GenerationResultView: View {
    @EnvironmentObject var state: GenerationResultViewModel
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            userGeneration
            userLocalityTotalPopulation
            userAgeGroupPopulation
            ageIndex
        }
        .padding(.horizontal)
        .navigationTitle(appState.selectedLocality.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension GenerationResultView {
    private var userGeneration: some View {
        TextResultRowView(
            title: "Patříš do generace",
            result: state.getUserGeneration(by: appState.userYearOfBirth).title,
            subTitle: state.getUserGeneration(by: appState.userYearOfBirth).yearRange
        )
    }

    private var userLocalityTotalPopulation: some View {
        TextResultRowView(
            title: "V obci \(appState.selectedLocality.name) žije celkem",
            result: "\(appState.filteredLocalityData?.attributes.totalPopulation?.formattedWithSeparator() ?? "") obyvatel",
            subTitle: nil
        )
    }

    private var userAgeGroupPopulation: some View {
        TextResultRowView(
            title: "Z toho je ve tvé věkové kategorii",
            result: "\(appState.filteredLocalityData?.attributes.getPopulation(by: appState.getUserAgeByYearOfBirth())?.formattedWithSeparator() ?? "") obyvatel",
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
    GenerationResultView()
        .environmentObject(GenerationResultViewModel())
        .environmentObject(AppState())
}
