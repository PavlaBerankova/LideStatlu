//
//  Feature.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import Foundation

struct Feature<T: Codable>: Codable {
    let attributes: T
}
