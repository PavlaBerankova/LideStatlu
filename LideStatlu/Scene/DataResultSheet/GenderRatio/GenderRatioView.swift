//
//  GenderRatioView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct GenderRatioView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            totalPopulationByGender
            averageAge
            totalAverageAge
            resetButton
        }
        .padding(.horizontal)
        .navigationTitle(appState.selectedLocality.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension GenderRatioView {
    private var totalPopulationByGender: some View {
        GenderResultRowView(
            title: "V obci Brno žije",
            femaleResult: "145 000 žen",
            maleResult: "150 000 mužů",
            subTitle: nil)
    }

    private var averageAge: some View {
        GenderResultRowView(
            title: "Průměrný věk",
            femaleResult: "42",
            maleResult: "43",
            subTitle: nil)
    }

    private var totalAverageAge: some View {
        TextResultRowView(
            title: "Celkový průměrný věk",
            result: "43",
            subTitle: nil)
    }

    private var resetButton: some View {
        Button {
            appState.isSheetPresented = false
            appState.resetQueryForm()
        } label: {
            HStack {
                Image(systemName: "arrow.clockwise")
                Text("Zkus to znovu")
            }
            .primaryButtonStyle()
        }
    }
}

#Preview {
    GenderRatioView()
        .environmentObject(AppState())
}
