//
//  DataResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct DataResultView: View {
    @Binding var isSheetPresented: Bool
    @Binding var userYearOfBirth: Int

    var body: some View {
        TabView {
            GenerationResultView(userYearOfBirth: $userYearOfBirth)
            GenderRatioView()
            NavigationStack {
                AgeStatsView(isSheetPresented: $isSheetPresented)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    DataResultView(isSheetPresented: .constant(true), userYearOfBirth: .constant(1990))
}
