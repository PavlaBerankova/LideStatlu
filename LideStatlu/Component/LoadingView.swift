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
    @Binding var isVisible: Bool
    @Binding var fetchError: FetchError?
    @State private var isShowingAlert: Bool = true

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
        .alert(fetchError?.errorDescription ?? "Něco se pokazilo", isPresented: $isShowingAlert) {
            Button("OK", role: .cancel) {
                fetchError = nil
                dismiss()
            }
            Button("Nastavení", role: .none) {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                       UIApplication.shared.open(url)
                   }
                dismiss()
            }
        }
    }
}

#Preview {
    LoadingView(isVisible: .constant(true), fetchError: .constant(.invalidResponse))
}
