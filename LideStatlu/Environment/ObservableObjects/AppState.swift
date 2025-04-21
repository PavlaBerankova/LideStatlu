//
//  AppState.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 20.04.2025.
//

import Foundation

@MainActor
class AppState: ObservableObject {
    // Data for Views and Picker
    @Published var ageStructures: [AgeStructure] = []
    @Published var localityNames: [Locality] = []
    @Published var filteredStructureData: AgeStructure?

    // Navigation states
    @Published var isSheetPresented: Bool = false
    @Published var isPresentedFullScreenCover: Bool = false

    // Global user input
    @Published var selectedLocality: Locality = Locality(id: 184, name: "Brno", district: "Brno-město")
    @Published var userYearOfBirth: Int = 1_999

    var ageStructureUrl: String = APIEndpoint.ageStructure.urlString

    func loadAgeStructureData() async throws {
        do {
            let dataResponse: Response<AgeStructure> = try await DataService.shared.fetchData(from: ageStructureUrl)
            self.ageStructures = dataResponse.features
        } catch {
            throw FetchError.invalidResponse
        }
    }

    func getFilteredAgeStructureData() {
        let filteredData = ageStructures.filter {
            $0.attributes.id == selectedLocality.id
        }
        self.filteredStructureData = filteredData.first
    }

    func getLocalityNames() {
        let mappedLocalityNames: [Locality] = ageStructures.map {
            Locality(
                id: $0.attributes.id,
                name: $0.attributes.localityName,
                district: $0.attributes.district)
        }
        let sortedNames = mappedLocalityNames.sorted {
            $0.name.compare($1.name, locale: Locale(identifier: "cs_CZ")) == .orderedAscending
        }
        localityNames = sortedNames
    }

    func getUserAgeByYearOfBirth() -> Int {
        let currentYear: Int = Calendar.current.component(.year, from: Date())
        let userYearOfBirth: Int = self.userYearOfBirth
        print(currentYear - userYearOfBirth)
        return currentYear - userYearOfBirth
    }

    func resetQueryForm() {
        self.selectedLocality = .init(id: 184, name: "Brno", district: "Brno-město")
        self.userYearOfBirth = .init(2_000)
    }
}
