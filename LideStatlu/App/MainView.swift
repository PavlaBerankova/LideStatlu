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
            symbolAndAppName
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
    private var symbolAndAppName: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom) {
                Group {
                    verticalRedLine(width: geometry.size.width * 0.1)
                    verticalRedLine(width: geometry.size.width * 0.07)
                        .frame(height: geometry.size.height * 0.60)
                }
                .padding([.top, .trailing])
                VStack(alignment: .leading) {
                    Text("Lidé")
                        .foregroundStyle(.black)
                    Text("v okolí")
                        .foregroundStyle(.black)
                    Text("Štatlu")
                        .foregroundStyle(.accent)
                }
                .font(.system(size: geometry.size.height * 0.12, weight: .bold))
            }
        }
        .padding(.bottom)
    }

    private var redLines: some View {
        Group {
            verticalRedLine(width: 25)
            verticalRedLine(width: 20)
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
            Text("Hoď na to čučku")
                .primaryButtonStyle()
                .scaleEffect(isPressed ? 0.95 : 1.0)
                .animation(.easeOut(duration: 0.2), value: isPressed)
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
