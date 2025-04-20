//
//  APIEndpoint.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import Foundation

enum APIEndpoint {
    case ageStructure
    case ageProfile

    var urlString: String {
        switch self {
        case .ageStructure:
            "https://services6.arcgis.com/fUWVlHWZNxUvTUh8/arcgis/rest/services/Věková_struktura_a_index_stáří_v_obcích_BMO/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json"
        case .ageProfile:
            "https://services6.arcgis.com/fUWVlHWZNxUvTUh8/arcgis/rest/services/BMO_obyvatele_2023/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json"
        }
    }
}
