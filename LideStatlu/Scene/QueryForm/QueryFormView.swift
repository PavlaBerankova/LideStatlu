//
//  QueryFormView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct QueryFormView: View {
    @StateObject var state = QueryFormViewModel()
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            Form {
                agePickerSection
                localitySection
            }
            VStack(alignment: .leading) {
                showDataResultButton
            }
            .padding(.horizontal)
            .sheet(isPresented: $appState.isSheetPresented) {
                DataResultView()
            }
            .toolbar {
                dismissButton
            }
        }
        .navigationTitle("Lidé okolo Štatlu")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension QueryFormView {
    private var agePickerSection: some View {
        Section {
            Picker("Rok narození", selection: $appState.userYearOfBirth) {
                ForEach(state.years, id: \.self) { year in
                    Text(String(year))
                }
            }
        } header: {
            Text("Kdy ses narodil?")
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
        }
    }

    private var localitySection: some View {
        Section {
            Picker("Obec", selection: $appState.selectedLocality) {
                ForEach(appState.localityNames, id: \.self) { locality in
                    Text("\(locality.name) ") +
                    Text("(okres \(locality.district))")
                        .foregroundColor(.secondary)
                }
            }
            .pickerStyle(.navigationLink)
        } header: {
            Text("Kde býváš?")
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
        }
    }

    private var showDataResultButton: some View {
        Button {
            appState.isSheetPresented = true
        } label: {
            Text("Hoď na to čučku")
                .primaryButtonStyle()
        }
        .padding(.bottom)
    }

    private var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                appState.isPresentedFullScreenCover = false
            } label: {
                Image(systemName: "xmark")
                    .padding()
            }
        }
    }
}

#Preview {
    NavigationStack {
        QueryFormView()
            .environmentObject(GenerationResultViewModel())
    }
}
