//
//  ResultRowView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 19.04.2025.
//

import SwiftUI

struct ResultRowView: View {
    let title: String
    let result: String?
    let subTitle: String?

    var body: some View {
        VStack {
            Divider()
            LazyVStack(alignment: .leading) {
                HStack {
                    Rectangle()
                        .foregroundStyle(.accent)
                        .frame(width: 10)
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.title2)
                        if let result = result {
                            Text(result)
                                .font(.largeTitle)
                                .bold()
                        }
                        if let subTitle = subTitle {
                            Text(subTitle)
                                .foregroundStyle(.secondary)
                                .font(.title3)
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
    ResultRowView(title: "Patříš do generace", result: "Mileniál", subTitle: "(1980-1997)")
}
