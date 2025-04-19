//
//  GenerationResultView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct GenerationResultView: View {
    @State private var mockData: [AgeStructure] = AgeStructure.mock

    var body: some View {
        VStack {
            userGeneration
            userLocalityTotalPopulation
            userAgeGroupPopulation
        }
        .padding(.horizontal)
    }
}

extension GenerationResultView {
    private var userGeneration: some View {
        ResultRowView(
            title: "Patříš do generace",
            result: "Mileniál",
            subTitle: "(1980-1997)"
        )
    }

    private var userLocalityTotalPopulation: some View {
        ResultRowView(
            title: "V obci \(mockData.first!.localityName) žije celkem",
            result: "\(mockData.first!.totalPopulation!) obyvatel",
            subTitle: nil
        )
    }

    private var userAgeGroupPopulation: some View {
        ResultRowView(
            title: "Z toho je ve tvém věku",
            result: "\(mockData.first!.age30to34!) obyvatel",
            subTitle: "\(mockData.first!.age30to34Title)"
        )
    }
}

#Preview {
    GenerationResultView()
}
