//
//  AgeStatsView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct AgeStatsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            VStack {
                Text("Statistiky podle věku")
                Button {
                    appState.isSheetPresented = false
                    appState.resetQueryForm()
                } label: {
                    Text("Zkus to znovu a jinak")
                        .foregroundStyle(.accent)
                        .padding(.top)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AgeStatsView()
            .environmentObject(AppState())
    }
}
