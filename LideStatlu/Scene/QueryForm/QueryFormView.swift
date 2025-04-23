//
//  QueryFormView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct QueryFormView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            Form {
                agePickerSection
                localitySection
            }
            VStack(alignment: .leading) {
                showStatisticsSheetButton
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
            let currentYear = Calendar.current.component(.year, from: Date())
            let years = 1_925...currentYear

            Picker("Rok narození", selection: $appState.userYearOfBirth) {
                ForEach(years, id: \.self) { year in
                    Text(String(year)).tag(year)
                }
            }
            .pickerStyle(.wheel)
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
            Text("Vyber oblast")
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
        }
    }

    private var showStatisticsSheetButton: some View {
        Button {
            appState.showStatisticsSheet()
        } label: {
            Text("Naval statistiky")
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
            .environmentObject(AppState())
    }
}
