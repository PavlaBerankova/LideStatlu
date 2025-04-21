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
                            .resultRowTitleStyle()
                            Text(result)
                            .resultRowValueStyle()
                        if let subTitle = subTitle {
                            Text(subTitle)
                                .resultRowSubtitleStyle()
                        }
                    }
                    .padding()
                }
            }
            .padding(.vertical, 5)
        }
    }
}

#Preview {
    TextResultRowView(title: "Patříš do generace", result: "Mileniál", subTitle: "(1980-1997)")
}
