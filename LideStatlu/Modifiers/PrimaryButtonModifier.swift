//
//  PrimaryButtonModifier.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 16)
            }
    }
}

extension View {
    func primaryButtonStyle() -> some View {
        self.modifier(PrimaryButtonModifier())
    }
}
