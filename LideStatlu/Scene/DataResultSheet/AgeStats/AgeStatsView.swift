//
//  AgeStatsView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct AgeStatsView: View {
    @Binding var isSheetPresented: Bool

    var body: some View {
        NavigationStack {
            VStack {
                Text("Statistiky podle věku")
                Button {
                    isSheetPresented = false
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
        AgeStatsView(isSheetPresented: .constant(true))
    }
}
