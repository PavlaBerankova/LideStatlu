//
//  View+Component.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 20.04.2025.
//

import SwiftUI

extension View {
    func verticalRedLine(width: CGFloat = 10) -> some View {
        Rectangle()
            .foregroundStyle(.accent)
            .frame(width: width)
    }
}
