//
//  GenderSymbolFontAndColorModifier.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 23.04.2025.
//

import SwiftUI

struct GenderSymbolModifier: ViewModifier {
    let isFigure: Bool
    let isFemale: Bool

    func body(content: Content) -> some View {
        content
            .font(isFigure ? .body : .footnote)
            .foregroundStyle(isFemale ? .accent : .customBlue)
    }
}

extension View {
    func genderSymbolStyle(isFigure: Bool, isFemale: Bool) -> some View {
        self.modifier(GenderSymbolModifier(isFigure: isFigure, isFemale: isFemale))
    }
}
