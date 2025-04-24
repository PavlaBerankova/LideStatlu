//
//  SearchEmptyView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 24.04.2025.
//

import SwiftUI

struct EmptySearchView: View {
    var body: some View {
        VStack {
            Image(.sadEmoji)
                .resizable()
                .renderingMode(.template)
                .frame(width: 80, height: 80)
                .padding()
            Text("Pro tuto obec nemáme žádná data")
                .foregroundStyle(.secondary)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(.title3)
                .padding()
        }
        .padding()
    }
}

#Preview {
    EmptySearchView()
}
