//
//  LocalityListView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 24.04.2025.
//

import SwiftUI

struct LocalityListView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss)
    private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                if appState.searchText.isEmpty {
                    allLocalityNames
                } else {
                    if appState.getSearchedLocality().isEmpty {
                        EmptySearchView()
                            .padding(.top)
                    }
                    searchedLocalityNames
                }
            }
            .searchable(text: $appState.searchText, placement: .toolbar, prompt: "Hledej obec")
        }
    }
}

extension LocalityListView {
    private var allLocalityNames: some View {
        List {
            ForEach(appState.localityNames, id: \.id) { locality in
                LocalityTitleRow(
                    title: nil,
                    locality: locality
                )
                .onTapGesture {
                    appState.selectedLocality = locality
                    dismiss()
                }
            }
        }
    }

    private var searchedLocalityNames: some View {
        List {
            ForEach(appState.getSearchedLocality(), id: \.id) { locality in
                HStack {
                    Text(locality.name)
                    Text(locality.district)
                        .foregroundStyle(.secondary)
                }
                .onTapGesture {
                    appState.selectedLocality = locality
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    LocalityListView()
        .environmentObject(AppState())
}
