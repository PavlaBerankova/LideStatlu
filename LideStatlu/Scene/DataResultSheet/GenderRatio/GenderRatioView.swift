//
//  GenderRatioView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct GenderRatioView: View {
    @ObservedObject var state: GenderRatioViewModel

    var body: some View {
        VStack {
            totalPopulationByGender
            averageAge
            totalAverageAge
                .padding(.bottom)
            tryAgainButton
        }
        .padding(.horizontal)
        .navigationTitle(state.selectedLocality.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension GenderRatioView {
    private var totalPopulationByGender: some View {
        GenderResultRowView(
            title: "V obci \(state.selectedLocality.name) žije",
            femaleResult: state.femalePopulation,
            maleResult: state.malePopulation,
            subTitle: nil)
    }

    private var averageAge: some View {
        GenderResultRowView(
            title: "Průměrný věk",
            femaleResult: state.femaleAverageAge,
            maleResult: state.maleAverageAge,
            subTitle: nil)
    }

    private var totalAverageAge: some View {
        TextResultRowView(
            title: "Celkový průměrný věk",
            result: state.totalAverageAge,
            subTitle: nil)
    }

    private var tryAgainButton: some View {
        Button {
            state.tryAgainButtonTapped()
        } label: {
            HStack {
                Image(systemName: "arrow.clockwise")
                Text("Zkus to znovu")
            }
            .primaryButtonStyle()
        }
        .padding(.top)
    }
}

#Preview {
    GenderRatioView(state: GenderRatioViewModel(appState: AppState()))
}
