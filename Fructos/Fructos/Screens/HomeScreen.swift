//
//  HomeScreen.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI

struct HomeScreen: View {
    // MARK:  PROPERTIES
    private var fruitList : [Fruit] = fruitsData
    
    
    // MARK:  BODY
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment:.leading,spacing: 5) {
                    ForEach(fruitList.shuffled()[0...12]) { item in
                        NavigationLink(destination: FruitDetailView(fruit: item)) {
                            ListTileView(fruit: item)
                            
                        }
                        }
                        
                }.hiddenNavigationBarStyle()
                    .padding(.top, 10)
            }
            .padding(.horizontal, 5)
            
        }
    }
    }



// MARK:  PREVIEW
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().preferredColorScheme(.light).navigationBarHidden(true)
          
            
    }
}





// Bugged navigation bar closing always use on parent of navigationLink
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("Back", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
