//
//  HomeScreen.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI

struct HomeScreen: View {
    // MARK:  PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    private var fruitList : [Fruit] = fruitsData
    
    
    // MARK:  BODY
    fileprivate func buildNavigationBarItemTrailing() -> Button<Image> {
        return Button(action: {
            isShowingSettings = true
        }, label: {
            Image(systemName: "slider.horizontal.3")
        })
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment:.leading,spacing: 5) {
                    ForEach(fruitList.shuffled()[0..<fruitList.count]) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        ListTileView(fruit: item)}
                }
                        
                }.hiddenNavigationBarStyle()
                    .navigationBarItems(trailing: buildNavigationBarItemTrailing()
                    .sheet(isPresented: $isShowingSettings,  content: {SettingsScreen()}))
                }
            .padding(.horizontal, 5)
            
        }
    }
    }



// MARK:  PREVIEW
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.light)
          
            
    }
}





// Bugged navigation bar closing always use on parent of navigationLink
struct PreferedNavigationModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Fruits", displayMode: .inline)
            
            
        
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( PreferedNavigationModifier() )
    }
}
