//
//  Response.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

struct Response<T: Codable>: Codable {
    let features: [T]
}
