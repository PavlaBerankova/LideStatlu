//
//  QueryFormViewModel.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

class QueryFormViewModel: ObservableObject {
    let years = Array(1_925...Calendar.current.component(.year, from: Date()))
}
