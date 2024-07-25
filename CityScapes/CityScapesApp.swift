//
//  CityScapes.swift
//  CityScapes
//
//  Created by Kelvin on 7/17/24.
//

import SwiftUI

@main
struct CityScapes: App {
    @State var model = BusinessModel()
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(model)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // TODO: on dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                        .environment(model)
                }
                .onAppear {
                    // If no onboarding is needeed, still get location
                    if needsOnboarding == false {
                        model.getUserLocation()
                    }
                }
        }
    }
}
