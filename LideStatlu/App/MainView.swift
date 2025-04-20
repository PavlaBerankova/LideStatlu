//
//  ContentView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct MainView: View {
    @State private var isPressed = false // pouze pro animaci buttonu
    // @EnvironmentObject var state: GenerationResultViewModel
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            logoBrno
            appName
            appDescription
            nextScreenButton
        }
        .padding()
        .fullScreenCover(isPresented: $appState.isPresentedFullScreenCover, content: QueryFormView.init)
        .task {
            try? await appState.loadAgeStructureData()
            appState.getLocalityNames()
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
            Text("v okolí")
                .foregroundStyle(.black)
            Text("Štatlu")
                .foregroundStyle(.accent)
        }
        .font(.system(size: 54, weight: .bold))
    }

    private var appDescription: some View {
        Text("Do jaké generace patříš, kolik lidí žije ve tvé obci, převažují ženy či muži?\nZjisti, kolik máš kolem sebe vrstevníků.\nMrkni na statistiky pro obce v metropolitní oblasti Brna.")
            .font(.title3)
            .padding(.top)
            .foregroundStyle(.black.opacity(0.8))
            .padding(.bottom, 50)
    }

    private var nextScreenButton: some View {
        Button {
            appState.isPresentedFullScreenCover = true
        } label: {
            Text("Pojďme na to")
                .primaryButtonStyle()
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
    NavigationStack {
        MainView()
            .environmentObject(GenerationResultViewModel())
            .environmentObject(AppState())
    }
}
