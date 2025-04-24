//
//  Int.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 20.04.2025.
//

import Foundation

extension Int {
    func formattedWithSeparator() -> String {
         let formatter = NumberFormatter()
         formatter.numberStyle = .decimal
         formatter.locale = Locale(identifier: "cs_CZ")
         return formatter.string(from: NSNumber(value: self)) ?? "\(self)" // 400000 -> 400 000
     }
}
