//
//  ResultRowTitleModifier.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 21.04.2025.
//

import SwiftUI

struct ResultRowTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .lineLimit(2)
    }
}

extension View {
    func resultRowTitleStyle() -> some View {
        modifier(ResultRowTitleModifier())
    }
}
