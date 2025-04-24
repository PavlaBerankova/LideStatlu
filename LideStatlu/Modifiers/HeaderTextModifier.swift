//
//  HeaderTextModifier.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 24.04.2025.
//

import SwiftUI

struct HeaderTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.secondary)
    }
}

extension View {
    func headerTextStyle() -> some View {
        modifier(HeaderTextModifier())
    }
}
