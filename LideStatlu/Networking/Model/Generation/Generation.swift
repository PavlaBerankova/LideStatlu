//
//  Generation.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

enum Generation: String {
    case genSilent
    case genBabyBoomers
    case genX
    case genY
    case genZ
    case genAlpha
    case none

    var yearRange: String {
        switch self {
        case .genSilent:
            return "(1925-1945)"
        case .genBabyBoomers:
            return "(1946-1964)"
        case .genX:
            return "(1965-1979)"
        case .genY:
            return "(1980-1994)"
        case .genZ:
            return "(1995-2012)"
        case .genAlpha:
            return "(2013-\(String(Calendar.current.component(.year, from: Date()))))"
        case .none:
            return "-"
        }
    }

    var title: String {
        switch self {
        case .genSilent:
            return "tzv. Tichá generace"
        case .genBabyBoomers:
            return "Baby Boomers"
        case .genX:
            return "X - Husákovy děti"
        case .genY:
            return "Y - Mileniálové"
        case .genZ:
            return "Z - internetová generace"
        case .genAlpha:
            return "Alpha"
        case .none:
            return "Neznámá"
        }
    }
}
