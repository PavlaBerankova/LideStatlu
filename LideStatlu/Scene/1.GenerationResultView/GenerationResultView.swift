//
//  GenerationResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct GenerationResultView: View {
    @StateObject var state = GenerationResultViewModel()

    var body: some View {
        VStack {
            userGeneration
            userLocalityTotalPopulation
            userAgeGroupPopulation
        }
        .padding(.horizontal)
        .task {
            try? await state.loadData()
            print(state.ageStructures)
        }
    }
}

extension GenerationResultView {
    private var userGeneration: some View {
        ResultRowView(
            title: "Patříš do generace",
            result: "Mileniál",
            subTitle: "(1980-1997)"
        )
    }

    private var userLocalityTotalPopulation: some View {
        ResultRowView(
            title: "V obci \(state.ageStructures.first?.attributes.localityName ?? "Unknown") žije celkem",
            result: "\(state.ageStructures.first?.attributes.totalPopulation ?? 00) obyvatel",
            subTitle: nil
        )
    }

    private var userAgeGroupPopulation: some View {
        ResultRowView(
            title: "Z toho je ve tvém věku",
            result: "\(state.ageStructures.first?.attributes.age30to34 ?? 00) obyvatel",
            subTitle: "30-34"
        )
    }
}

#Preview {
    GenerationResultView()
}
