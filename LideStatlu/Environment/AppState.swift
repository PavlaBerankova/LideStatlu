//
//  AppState.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 20.04.2025.
//

import Foundation

@MainActor
class AppState: ObservableObject {
    // States
    @Published var ageStructures: [AgeStructure] = []
    @Published var ageProfiles: [AgeProfile] = []
    @Published var localityNames: [Locality] = []
    @Published var filteredStructureData: AgeStructure?
    @Published var filteredProfileData: AgeProfile?
    @Published var isLoading = true
    @Published var fetchError: FetchError = .noError
    @Published var isShowingErrorAlert: Bool = false

    // Navigation states
    @Published var isSheetPresented: Bool = false
    @Published var isPresentedFullScreenCover: Bool = false

    // User input
    @Published var selectedLocality: Locality = Locality(id: 184, name: "Brno", district: "Brno-město")
    @Published var userYearOfBirth: Int = 2_000

    private let dataProvider: DataProvider

      init(dataProvider: DataProvider = MockDataProvider()) {
          self.dataProvider = dataProvider
      }

    func loadAgeProfileData() async throws {
        do {
            let dataResponse = try await dataProvider.fetchAgeProfileData()
            self.ageProfiles = dataResponse
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

    func getFilteredAgeProfileData() {
        let filteredData = ageProfiles.filter {
            $0.attributes.id == selectedLocality.id
        }
        self.filteredProfileData = filteredData.first
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

    func backToQueryForm() {
        self.isSheetPresented = false
    }

    func showStatisticsSheet() {
        self.isSheetPresented = true
        getFilteredAgeProfileData()
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
