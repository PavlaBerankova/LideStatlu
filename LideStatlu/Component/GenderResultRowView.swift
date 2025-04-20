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
                        descriptionText
                        Group {
                            femaleResultLine
                            maleResultLine
                        }
                        .font(.largeTitle)
                        .bold()
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

extension GenderResultRowView {
    private var descriptionText: some View {
        Text(title)
            .font(.title2)
    }

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
