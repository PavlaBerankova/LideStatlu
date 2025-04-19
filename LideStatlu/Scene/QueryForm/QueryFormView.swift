//
//  QueryFormView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct QueryFormView: View {
    @Environment(\.presentationMode)
    var presentationMode
    @EnvironmentObject var globalState: GenerationResultViewModel
    @StateObject var queryState = QueryFormViewModel()

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
            .sheet(isPresented: $queryState.isSheetPresented) {
                DataResultView(
                    isSheetPresented: $queryState.isSheetPresented,
                    userYearOfBirth: $queryState.userYearOfBirth)
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
            Picker("Rok narození", selection: $queryState.userYearOfBirth) {
                ForEach(queryState.years, id: \.self) { year in
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
            Picker("Obec", selection: $queryState.selectedLocalityName) {
                ForEach(globalState.localityNames, id: \.self) { locality in
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
            queryState.isSheetPresented = true
        } label: {
            Text("Hoď na to čučku")
                .primaryButtonStyle()
        }
        .padding(.bottom)
    }

    private var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "xmark")
                .padding()
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
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
