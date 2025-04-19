//
//  QueryFormView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct Locality: Hashable {
    let name: String
    let district: String
}

struct QueryFormView: View {
    @Environment(\.presentationMode)
    var presentationMode
    @EnvironmentObject var state: GenerationResultViewModel
    @State private var isSheetPresented = false
    @State private var userAge: Int = 2_000
    @State private var selectedLocalityName: Locality = Locality(name: "Brno", district: "Brno-město")

    var body: some View {
        NavigationStack {
            Form {
                ageSection
                municipalitySection
                Button {
                    print(state.localityNames)
                } label: {
                    Text("Show locality names")
                }
            }
            VStack(alignment: .leading) {
                showDataResultButton
            }
            .padding(.horizontal)
            .sheet(isPresented: $isSheetPresented) {
                DataResultView(isSheetPresented: $isSheetPresented)
            }
            .toolbar {
                dismissButton
            }
        }

        .navigationTitle("Lidé Štatlu")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension QueryFormView {
    private var ageSection: some View {
        Section {
            Picker("Rok narození", selection: $userAge) {
                ForEach(1_920...2_025, id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.automatic)
        } header: {
            Text("Kdy ses narodil?")
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
        }
    }

    private var municipalitySection: some View {
        Section {
            Picker("Obec", selection: $selectedLocalityName) {
                ForEach(state.localityNames, id: \.self) { locality in
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
            isSheetPresented = true
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
    }
}
