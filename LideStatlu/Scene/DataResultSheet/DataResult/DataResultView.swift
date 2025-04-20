//
//  DataResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct DataResultView: View {
    var body: some View {
        TabView {
            GenerationResultView()
            GenderRatioView()
            AgeStatsView()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    DataResultView()
}
