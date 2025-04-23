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
            Divider()
            ScrollView {
                headerRow
                totalPopulationByGender
                averageAge
                genderCountAge0to14
                genderCountAge15to64
                genderCountAge65plus
            }
            .scrollIndicators(.hidden)
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

    private var headerRow: some View {
        HeaderResultView(title: "Rozdělení mužů a žen")
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

    private var genderCountAge0to14: some View {
        GenderResultRowView(
            title: "Ve věku 0-14 let zde žije",
            femaleResult: state.femaleGroup0to14 + " žen",
            maleResult: state.maleGroup0to14 + " mužů",
            subTitle: nil)
    }

    private var genderCountAge15to64: some View {
        GenderResultRowView(
            title: "Ve věku 15-64 let zde žije",
            femaleResult: state.femaleGroup15to64 + " žen",
            maleResult: state.maleGroup15to64 + " mužů",
            subTitle: nil)
    }

    private var genderCountAge65plus: some View {
        GenderResultRowView(
            title: "Ve věku 65+ let zde žije",
            femaleResult: state.femaleGroup65plus + " žen",
            maleResult: state.maleGroup65plus + " mužů",
            subTitle: nil)
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
