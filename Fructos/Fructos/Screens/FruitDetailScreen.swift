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
                        buildTitle()
                        // MARK:  HEADLINE
                        buildFruitHeadline()
                        // MARK:  Nutri
                        FruitNutritientsView(fruit:fruit)
                        // MARK:  SUBHEADLINE
                        buildSubHeadline()
                            // MARK:  DESCRIPTION
                        buildDescription()
                        // MARK:  LINK
                        SourceLinkView().padding(.bottom,50)
                    }// MARK:  VSTACK
                    .padding(.horizontal,20)
                    .frame(maxWidth:640, alignment: .leading)
                }// MARK:  VSTACK
                .navigationBarTitleDisplayMode(.inline)
                
               
                
                
            }// MARK:  SCROLL
            .ignoresSafeArea()
        }// MARK:  NAVIGATION
    }// MARK:  BODY
    
    
    fileprivate func buildTitle() -> Text {
        return Text(fruit.title)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(fruit.gradientColors[1])
    }
    
    
    fileprivate func buildFruitHeadline() -> some View {
           
        return Text(fruit.headline)
            .font(.headline)
            .multilineTextAlignment(.leading)
    }
    
    fileprivate func buildSubHeadline() -> Text {
        return Text("Learn more about \(fruit.title.uppercased())")
            .fontWeight(.bold)
            .foregroundColor(fruit.gradientColors[1])
    }
    
    fileprivate func buildDescription() -> some View {
        return Text(fruit.description)
            .font(.callout)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
    }

}


// MARK:  PREVIW
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
            
    }
}


