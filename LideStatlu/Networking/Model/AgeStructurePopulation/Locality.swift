//
//  Locality.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

struct Locality: Hashable, Equatable {
    let id: Int
    let name: String
    let district: String
}

extension Locality {
    static func ==(lhs: Locality, rhs: Locality) -> Bool {
        return lhs.id == rhs.id
    }
}
