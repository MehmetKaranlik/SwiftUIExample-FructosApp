//
//  FruitDetailView.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI

struct FruitDetailView: View {
    // MARK:  PROPERTIES
     var fruit:Fruit
    
    
    
    
    // MARK:  BODY

    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .center, spacing: 20){
                    // MARK:  Header
                    FruitImageCardView(width: .infinity, heigth: 500, radius: 0, fruit: fruit)
                    VStack(alignment: .leading, spacing: 20) {
                        // MARK:  TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        buildFruitHeadline()
                        // MARK:  Nutri
                        // MARK:  SUBHEADLINE
                        Text("Learn more about \(fruit.title.uppercased())")
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        // MARK:  DESCRIPTION
                        Text(fruit.description)
                            .font(.callout)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            
                            
                        // MARK:  LINK
                    }// MARK:  VSTACK
                    .padding(.horizontal,20)
                    .frame(maxWidth:640, alignment: .leading)
                }// MARK:  VSTACK
                .hiddenNavigationBarStyle().ignoresSafeArea().padding(.top, -50)
            }// MARK:  SCROLL
            
        }// MARK:  NAVIGATION
    
    
    
 
    }// MARK:  BODY
    fileprivate func buildFruitHeadline() -> some View {
            // MARK:  HEADLINE
        return Text(fruit.headline)
            .font(.headline)
            .multilineTextAlignment(.leading)
    }

}


// MARK:  PREVIW
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}


