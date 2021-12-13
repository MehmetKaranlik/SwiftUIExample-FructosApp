//
//  ContentView.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI

struct ContentView: View {
    // MARK:  PROPERTIES
    fileprivate var fruitList : [Fruit] = fruitsData
    
    // MARK:  BODY
    var body: some View {
        ScrollView {
            VStack(alignment:.leading,spacing: 5) {
                ForEach(fruitList[0...12]) { item in
                    ListTileView(fruit: item)
                }
            }
            .padding(.horizontal, 5)
        }
     
    }
    
}


    
    
    // MARK:  PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

    



