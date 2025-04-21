//
//  DataResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct DataResultView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        TabView {
            NavigationStack {
                GenerationResultView(state: GenerationResultViewModel(appState: appState))
            }
            NavigationStack {
                GenderRatioView()
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    DataResultView()
}
