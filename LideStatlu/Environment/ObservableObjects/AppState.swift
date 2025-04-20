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
    @Published var ageProfiles: [AgeProfile] = []
    @Published var localityNames: [Locality] = []
    @Published var filteredStructureData: [AgeStructure] = []
    @Published var filteredProfileData: [AgeProfile] = []

    // Navigation states
    @Published var isSheetPresented: Bool = false
    @Published var isPresentedFullScreenCover: Bool = false

    // Global user input
    @Published var selectedLocality: Locality = Locality(name: "Brno", district: "Brno-město")
    @Published var userYearOfBirth: Int = 2_000

    var ageStructureUrl: String = APIEndpoint.ageStructure.urlString
    var ageProfileUrl: String = APIEndpoint.ageProfile.urlString

    func loadAgeStructureData() async throws {
        do {
            let dataResponse: Response<AgeStructure> = try await DataService.shared.fetchData(from: ageStructureUrl)
            self.ageStructures = dataResponse.features
        } catch {
            throw FetchError.invalidResponse
        }
    }

    func loadAgeProfileData() async throws {
        do {
            let dataResponse: Response<AgeProfile> = try await DataService.shared.fetchData(from: ageProfileUrl)
            self.ageProfiles = dataResponse.features
        } catch {
            throw FetchError.invalidResponse
        }
    }

    func getLocalityNames() {
        let mappedNames: [Locality] = ageStructures.map { Locality(name: $0.attributes.localityName, district: $0.attributes.district) }
        let sortedNames = mappedNames.sorted {
            $0.name.compare($1.name, locale: Locale(identifier: "cs_CZ")) == .orderedAscending // správné řazení podle českého jazyka
        }
        localityNames = sortedNames
    }

    func getUserAgeByYearOfBirth() -> Int {
        let currentYear: Int = Calendar.current.component(.year, from: Date())
        let userYearOfBirth: Int = self.userYearOfBirth
        print(currentYear - userYearOfBirth)
        return currentYear - userYearOfBirth
    }

    func filteredAgeStructureDataByLocality() {
        let filteredData = ageStructures.filter { $0.attributes.localityName == selectedLocality.name && $0.attributes.district == selectedLocality.district }
        self.filteredStructureData = filteredData
    }

    func filteredAgeProfileDataByLocality() {
        let filteredData = ageProfiles.filter { $0.attributes.localityName == selectedLocality.name && $0.attributes.district == selectedLocality.district }
        self.filteredProfileData = filteredData
    }

    func resetQueryForm() {
        self.selectedLocality = .init(name: "Brno", district: "Brno-město")
        self.userYearOfBirth = .init(2_000)
    }
}
