//
//  AppState.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 20.04.2025.
//

import Foundation
import os

let logger = Logger()

@MainActor
class AppState: ObservableObject {
    // State
    @Published var ageStructures: [AgeStructure] = []
    @Published var genderProfiles: [GenderProfile] = []
    @Published var localityNames: [Locality] = []
    @Published var filteredStructureData: AgeStructure?
    @Published var filteredGenderData: GenderProfile?
    @Published var isLoading = true
    @Published var fetchError: FetchError = .noError
    @Published var isShowingErrorAlert: Bool = false

    // Navigation state
    @Published var isSheetPresented: Bool = false
    @Published var isPresentedFullScreenCover: Bool = false

    // User input
    @Published var selectedLocality: Locality = Locality(id: 184, name: "Brno", district: "Brno-město")
    @Published var userYearOfBirth: Int = 2_000

    // Search
    @Published var searchText: String = String()

    private let dataProvider: DataProvider

      init(dataProvider: DataProvider = NetworkDataProvider()) {
          self.dataProvider = dataProvider
      }

    func loadGenderProfileData() async throws {
        do {
            let dataResponse = try await dataProvider.fetchGenderProfileData()
            self.genderProfiles = dataResponse
        } catch {
            fetchError = FetchError.invalidResponse
            throw FetchError.invalidResponse
        }
    }

    func loadAgeStructureData() async throws {
        do {
            let dataResponse = try await dataProvider.fetchAgeStructureData()
            self.ageStructures = dataResponse
        } catch {
            fetchError = FetchError.invalidResponse
            throw FetchError.invalidResponse
        }
    }

    func getFilteredAgeStructureData() {
            let filteredData = ageStructures.filter {
                $0.attributes.id == selectedLocality.id
            }
            self.filteredStructureData = filteredData.first
    }

    func getFiltereGenderProfileData() {
            let filteredData = genderProfiles.filter {
                $0.attributes.id == selectedLocality.id
            }
            self.filteredGenderData = filteredData.first
    }

    func getSearchedLocality() -> [Locality] {
        let localityFields = localityNames
        let filtered = localityFields.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        return filtered
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
        logger.log("Locality names: type Locality: \(sortedNames)")
    }

    func getUserAgeByYearOfBirth() -> Int {
        let currentYear: Int = Calendar.current.component(.year, from: Date())
        let userYearOfBirth: Int = self.userYearOfBirth
        return currentYear - userYearOfBirth
    }

    func backToQueryForm() {
        self.isSheetPresented = false
    }

    func showStatisticsSheet() {
        self.isSheetPresented = true
        getFiltereGenderProfileData()
        getFilteredAgeStructureData()
    }

    func showErrorAlert() {
        if fetchError == .noError {
            self.isShowingErrorAlert = false
        } else {
            self.isShowingErrorAlert = true
        }
    }
}
