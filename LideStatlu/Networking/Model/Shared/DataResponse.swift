//
//  Untitled.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

struct DataResponse<T: Codable>: Codable {
    let features: [Feature<T>]
}
