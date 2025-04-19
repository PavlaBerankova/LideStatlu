//
//  QueryFormViewModel.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

class QueryFormViewModel: ObservableObject {
    @Published var isSheetPresented = false
    @Published var selectedLocalityName: Locality = Locality(name: "Brno", district: "Brno-město")
    @Published var userYearOfBirth: Int = 2_000
    let years = Array(1_925...Calendar.current.component(.year, from: Date()))

  
}
