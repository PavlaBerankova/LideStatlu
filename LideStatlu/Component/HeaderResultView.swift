//
//  HeaderResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 23.04.2025.
//

import SwiftUI

struct HeaderResultView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.callout)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    HeaderResultView(title: "Struktura obyvatel")
}
