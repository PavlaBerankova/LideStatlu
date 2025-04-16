//
//  ContentView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct MainView: View {
    @State private var isPressed = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                logoBrno
                appName
                appDescription
                nextScreenButton
            }
            .padding()
        }
    }
}

extension MainView {
    private var logoBrno: some View {
        Image(.logoBrno)
            .resizable()
            .scaledToFit()
    }

    private var appName: some View {
        Group {
            Text("Lidé")
                .foregroundStyle(.black)
            Text("Štatlu")
                .foregroundStyle(.accent)
        }
        .font(.system(size: 54, weight: .bold))
        .bold()
    }

    private var appDescription: some View {
        Text("Zjisti, kdo kolem tebe žije.\nKolik vrstevníků je ve tvé čtvrti. Mrkni na statistiky podle věku a pohlaví pro každou část Brna. ")
            .font(.title3)
            .padding(.top)
            .foregroundStyle(.black.opacity(0.8))
            .padding(.bottom, 30)
    }

    private var nextScreenButton: some View {
        NavigationLink {
            QueryFormView()
        } label: {
            Text("Hoď na to čučku")
                .font(.title2)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                }
                .scaleEffect(isPressed ? 0.95 : 1.0)
                       .animation(.easeOut(duration: 0.2), value: isPressed)
                       .simultaneousGesture(
                           DragGesture(minimumDistance: 0)
                               .onChanged { _ in isPressed = true }
                               .onEnded { _ in isPressed = false }
                       )
        }
    }
}

#Preview {
    MainView()
}
