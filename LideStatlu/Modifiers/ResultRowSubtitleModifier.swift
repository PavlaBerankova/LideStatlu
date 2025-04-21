//
//  ResultRowSubtitleModifier.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 21.04.2025.
//

import SwiftUI

struct ResultRowSubtitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
            .font(.subheadline)
    }
}

extension View {
    func resultRowSubtitleStyle() -> some View {
        modifier(ResultRowSubtitleModifier())
    }
}
