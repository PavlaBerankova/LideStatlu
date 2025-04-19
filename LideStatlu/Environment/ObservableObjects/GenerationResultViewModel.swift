//
//  GenerationResultViewModel.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import Foundation

@MainActor
class GenerationResultViewModel: ObservableObject {
    @Published var ageStructures: [AgeStructure] = []
    @Published var localityNames: [Locality] = []
    @Published var userGeneration: Generation?

    var urlString: String = APIEndpoint.ageStructure.urlString

    func loadData() async throws {
        do {
            let dataResponse: Response<AgeStructure> = try await DataService.shared.fetchData(from: urlString)
            self.ageStructures = dataResponse.features
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

    func getUserGeneration(from year: Int) -> Generation {
        switch year {
        case 1_925...1_945:
            return .genSilent
        case 1_946...1_964:
            return .genBabyBoomers
        case 1_965...1_979:
            return .genX
        case 1_980...1_994:
            return .genY
        case 1_995...2_012:
            return .genZ
        case 2_013...Calendar.current.component(.year, from: Date()):
            return .genAlpha
        default:
            return .none
        }
    }
}
