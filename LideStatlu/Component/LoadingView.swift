//
//  LoadingView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 21.04.2025.
//

import ActivityIndicatorView
import SwiftUI

struct LoadingView: View {
    @Environment(\.dismiss)
    var dismiss
    @EnvironmentObject var appState: AppState

    @Binding var isVisible: Bool
    @Binding var fetchError: FetchError
    @Binding var isShowingErrorAlert: Bool

    var body: some View {
        VStack {
            Text("Připravuji data...")
                .font(.largeTitle)
                .bold()
                .padding()
            ActivityIndicatorView(isVisible: $isVisible, type: .equalizer(count: 3))
                .foregroundStyle(.accent)
                .frame(width: 100, height: 200)
        }
        .padding(.horizontal)
        .alert(fetchError.errorDescription ?? "Něco se pokazilo", isPresented: $isShowingErrorAlert) {
            Button("OK", role: .cancel) {
                fetchError = .noError
                dismiss()
            }
            Button("Nastavení", role: .none) {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                       UIApplication.shared.open(url)
                   }
                dismiss()
            }
        }
        .task {
            do {
                try await withThrowingTaskGroup(of: Void.self) { group in
                    group.addTask {
                        try await appState.loadAgeStructureData()
                    }
                    group.addTask {
                        try await appState.loadGenderProfileData()
                    }
                    try await group.waitForAll()
                }
                appState.getLocalityNames()
                appState.isLoading = false
            } catch {
                fetchError = .invalidResponse
                appState.showErrorAlert()
            }
        }
    }
}

#Preview {
    LoadingView(isVisible: .constant(true), fetchError: .constant(.invalidResponse), isShowingErrorAlert: .constant(true))
}
