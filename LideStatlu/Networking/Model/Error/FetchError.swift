//
//  FetchError.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

enum FetchError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
}
