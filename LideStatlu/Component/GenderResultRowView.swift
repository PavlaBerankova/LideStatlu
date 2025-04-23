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
    let subTitle: String?

    let dotImage = Image(systemName: "circle.fill")
    let femaleImage = Image(systemName: "figure.stand.dress")
    let maleImage = Image(systemName: "figure.stand")

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
            if #available(iOS 18.0, *) {
                femaleImage
                    .genderSymbolStyle(isFigure: true, isFemale: true)
            } else {
                dotImage
                    .genderSymbolStyle(isFigure: false, isFemale: true)
            }
            Text(femaleResult)
        }
    }

    private var maleResultLine: some View {
        HStack {
            if #available(iOS 18.0, *) {
                maleImage
                    .genderSymbolStyle(isFigure: true, isFemale: false)
            } else {
                dotImage
                    .genderSymbolStyle(isFigure: false, isFemale: false)
            }
            Text(maleResult)
        }
    }
}

#Preview() {
    GenderResultRowView(title: "V obci Brno žije celkem", femaleResult: "145 000 žen", maleResult: "156 000 mužů", subTitle: "(30-34 let)")
}
