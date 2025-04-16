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
    @State private var isSheetPresented = false
    @State private var userAge: Int = 30
    @State private var userMunicipality: String = "Zakřany"
    @State private var testArea = ["Zakřany", "Rosice", "Zbýšov", "Nový Lískovec", "Líšeň"]

    var body: some View {
        NavigationStack {
            Form {
                ageSection
                municipalitySection
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
            Picker("Věk", selection: $userAge) {
                ForEach(0...100, id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.automatic)
        } header: {
            Text("Kolik ti je?")
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
        }
    }

    private var municipalitySection: some View {
        Section {
            Picker("Obec", selection: $userMunicipality) {
                ForEach(testArea, id: \.self) { area in
                    Text(area)
                }
            }
            .pickerStyle(.menu)
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
