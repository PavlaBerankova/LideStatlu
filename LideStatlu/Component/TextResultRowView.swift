//
//  ResultRowView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import SwiftUI

struct TextResultRowView: View {
    let title: String
    let result: String
    let subTitle: String?

    var body: some View {
        VStack {
            Divider()
            LazyVStack(alignment: .leading) {
                HStack {
                    verticalRedLine()
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.title2)
                            Text(result)
                                .font(.largeTitle)
                                .bold()
                        if let subTitle = subTitle {
                            Text(subTitle)
                                .foregroundStyle(.secondary)
                                .font(.subheadline)
                        }
                    }
                    .padding()
                }
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    TextResultRowView(title: "Patříš do generace", result: "Mileniál", subTitle: "(1980-1997)")
}
