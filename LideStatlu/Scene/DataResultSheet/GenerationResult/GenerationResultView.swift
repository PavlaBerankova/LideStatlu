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
        }
        .padding(.horizontal)
    }
}

extension GenerationResultView {
    private var userGeneration: some View {
        ResultRowView(
            title: "Patříš do generace",
            result: state.getUserGeneration(by: appState.userYearOfBirth).title,
            subTitle: state.getUserGeneration(by: appState.userYearOfBirth).yearRange
        )
    }

    private var userLocalityTotalPopulation: some View {
        ResultRowView(
            title: "V obci \(appState.ageStructures.first?.attributes.localityName ?? "Unknown") žije celkem",
            result: "\(appState.ageStructures.first?.attributes.totalPopulation ?? 00) obyvatel",
            subTitle: nil
        )
    }

    private var userAgeGroupPopulation: some View {
        ResultRowView(
            title: "Z toho je ve tvém věku",
            result: "\(appState.ageStructures.first?.attributes.age30to34 ?? 00) obyvatel",
            subTitle: "30-34"
        )
    }
}

#Preview {
    GenerationResultView()
        .environmentObject(GenerationResultViewModel())
        .environmentObject(AppState())
}
