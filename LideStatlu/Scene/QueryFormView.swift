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

    var body: some View {
        NavigationStack {
            VStack {
                queryForm
                showDataResultButton
            }
            .sheet(isPresented: $isSheetPresented) {
                DataResultView(isSheetPresented: $isSheetPresented)
            }
            .toolbar {
                dismissButton
            }
        }
    }
}

extension QueryFormView {
    private var queryForm: some View {
        Text("Formulář pro uživatele")
    }

    private var showDataResultButton: some View {
        Button {
            isSheetPresented = true
        } label: {
            Text("Hoď to sem")
        }
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
