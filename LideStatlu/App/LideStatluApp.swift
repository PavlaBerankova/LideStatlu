//
//  LideStatluApp.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

@main
struct LideStatluApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView()
                    .preferredColorScheme(.light)
            }
        }
    }
}
