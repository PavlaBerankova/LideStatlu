//
//  ImageResultRowView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 20.04.2025.
//

import SwiftUI

struct GenderResultRowView: View {
    let title: String
    let femaleResult: String
    let maleResult: String
    let femaleImage = Image(systemName: "figure.stand.dress")
    let maleImage = Image(systemName: "figure.stand")
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
                        Group {
                            femaleResultLine
                            maleResultLine
                        }
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

extension GenderResultRowView {
    private var femaleResultLine: some View {
        HStack {
            femaleImage
                .foregroundStyle(.accent)
            Text(femaleResult)
        }
    }

    private var maleResultLine: some View {
        HStack {
            maleImage
            Text(maleResult)
        }
    }
}

#Preview {
    GenderResultRowView(title: "V obci Brno žije celkem", femaleResult: "145 000 žen", maleResult: "156 000 mužů", subTitle: "(30-34 let)")
}


