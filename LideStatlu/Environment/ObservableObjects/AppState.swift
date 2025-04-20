//
//  AppState.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 20.04.2025.
//

import Foundation

class AppState: ObservableObject {
    @Published var ageStructures: [AgeStructure] = [] // zde potřebuju nahrát data z API, při spuštění aplikace MainView
    @Published var localityName: [Locality] = [] // zde přemapuju a seřadím názvy všech obcí z API JSONu, nutné pro Picker v QueryForm
    @Published var isPresentedFullScreenCover: Bool = false
}
