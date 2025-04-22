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
    case noError
}

extension FetchError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL adresa dat je neplatná."
        case .invalidResponse:
            return "Data nelze načíst. Zkontroluj připojení k internetu."
        case .decodingFailed:
            return "Data se nepodařilo zpracovat. Zkus to prosím později."
        default:
            return nil
        }
    }
}
