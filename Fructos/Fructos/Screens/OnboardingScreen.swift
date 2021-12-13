//
//  OnboardingScreen.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI

struct OnboardingScreen: View {
    // MARK:  PROPERTIES
    
    
    // MARK:  BODY
    var body: some View {
        TabView {
            ForEach(0..<6) {   item in
                FruitCardView()
            }// MARK:  Loop
           
        }.tabViewModifier()

    }
}

// MARK:  PREVIEW
struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}

extension TabView {
    fileprivate func tabViewModifier() -> some View {
        self
            .tabViewStyle(PageTabViewStyle())
            .padding(.all , 15)
    }
}
