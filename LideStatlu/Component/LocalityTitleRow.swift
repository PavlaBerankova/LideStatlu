//
//  LocalityTitleRow.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 24.04.2025.
//

import SwiftUI

struct LocalityTitleRow: View {
    let title: String?
    let locality: Locality

    var body: some View {
        HStack {
            if let title = title {
                Text(title)
                Spacer()
            }
            Text(locality.name)
            Text("(\(locality.district))")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    LocalityTitleRow(title: "Obec", locality: Locality(id: 1, name: "Neslovice", district: "Brno-venkov"))
}
