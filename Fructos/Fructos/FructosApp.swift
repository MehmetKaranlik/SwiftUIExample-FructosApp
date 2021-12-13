//
//  FructosApp.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI

@main
struct FructosApp: App {
    @AppStorage("isOnboarding") var isFirstLaunch : Bool = true
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
            OnboardingScreen()
            } else {
               HomeScreen()
                    
            }
        }
    }
}
