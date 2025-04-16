//
//  DataResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct DataResultView: View {
    @Binding var isSheetPresented: Bool

    var body: some View {
        TabView {
            GenerationResultView()
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
    DataResultView(isSheetPresented: .constant(true))
}
