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
        VStack(alignment: .center) {
            localityName
            totalPopulationByGender
            averageAge
            totalAverageAge
            Spacer()

            tryAgainButton
                .padding(.bottom)
        }
        .padding()
        Spacer()
    }
}

extension GenderRatioView {
    private var localityName: some View {
        Text(state.selectedLocality.name)
            .resultViewTitleStyle()
    }

    private var totalPopulationByGender: some View {
        GenderResultRowView(
            title: "Žije zde",
            femaleResult: state.femalePopulation,
            maleResult: state.malePopulation,
            subTitle: nil)
    }

    private var averageAge: some View {
        GenderResultRowView(
            title: "Průměrný věk je",
            femaleResult: state.femaleAverageAge + " u žen",
            maleResult: state.maleAverageAge + " u mužů",
            subTitle: nil)
    }

    private var totalAverageAge: some View {
        TextResultRowView(
            title: "Celkový průměrný věk",
            result: state.totalAverageAge,
            subTitle: nil
        )
        .padding(.bottom)
    }

    private var tryAgainButton: some View {
        Button {
            state.tryAgainButtonTapped()
        } label: {
            HStack {
                Image(systemName: "arrow.clockwise")
                Text("Dáme repete")
            }
            .primaryButtonStyle()
        }
        .padding(.bottom)
    }
}

#Preview {
    GenderRatioView(state: GenderRatioViewModel(appState: AppState()))
}
