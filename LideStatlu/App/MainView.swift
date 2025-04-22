//
//  ContentView.swift
//  LideStatlu
//
//  Created by Pavla Beránková on 16.04.2025.
//

import SwiftUI

struct MainView: View {
    @State private var isPressed = false // only for button animation
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack(alignment: .bottom) {
                redLines
                appName
            }
            appDescription
            nextScreenButton
        }
        .padding()
        .fullScreenCover(isPresented: $appState.isPresentedFullScreenCover) {
            if appState.isLoading {
                LoadingView(isVisible: $appState.isLoading, fetchError: $appState.fetchError, isShowingErrorAlert: $appState.isShowingErrorAlert)
            } else {
                QueryFormView()
            }
        }
    }
}

extension MainView {
    private var redLines: some View {
        Group {
            verticalRedLine(width: 25)
            verticalRedLine(width: 20)
                .frame(height: 200)
        }
        .padding([.top, .trailing])
    }

    private var appName: some View {
        VStack(alignment: .leading) {
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
        Text("Zjisti, do jaké generace patříš nebo kolik lidí ve tvé věkové skupině žije ve tvé obci.\n\nProzkoumej statistiky obcí v metropolitní oblasti Brna — třeba tě překvapí poměr žen a mužů nebo index stáří.")
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
            .environmentObject(GenerationResultViewModel(appState: AppState()))
            .environmentObject(AppState())
    }
}
