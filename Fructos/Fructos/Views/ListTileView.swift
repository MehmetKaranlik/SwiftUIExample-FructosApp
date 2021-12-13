//
//  ListTileView.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI

struct ListTileView: View {
    // MARK:  PROPERTIES
    var fruit:Fruit
    
    
    // MARK:  BODY
    var body: some View {
        HStack(alignment: .top, spacing: 10){
           
    Image(fruit.image)
                .imageModifier(fruits: fruit)
            VStack(alignment:.leading, spacing: 5) {
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(
    Color("Color\(fruit.title)Light"))
            
                Text(fruit.headline)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
            }
            

        }// MARK:  HSTACK
        
        
        
    }
}
// MARK:  PREVIEW


struct ListTileView_Previews: PreviewProvider {
    static var previews: some View {
        ListTileView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

extension Image {
    fileprivate func imageModifier(fruits: Fruit) -> some View {
        return self
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80, alignment: .center)
            .shadow(color: Color(red: 0, green: 0, blue: 0 , opacity: 0.35), radius: 15, x: 6, y: 12 )
            .background(LinearGradient(gradient: Gradient(colors: fruits.gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(8)
        
    }
}
