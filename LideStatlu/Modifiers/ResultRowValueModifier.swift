//
//  ResultRowValueModifier.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 21.04.2025.
//

import SwiftUI

struct ResultRowValueModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
    }
}

extension View {
    func resultRowValueStyle() -> some View {
        modifier(ResultRowValueModifier())
    }
}
