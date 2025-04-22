//
//  ResultViewTitleModifier.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 22.04.2025.
//

import SwiftUI

struct ResultViewTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .bold()
            .lineLimit(1)
    }
}

extension View {
    func resultViewTitleStyle() -> some View {
        modifier(ResultViewTitleModifier())
    }
}
