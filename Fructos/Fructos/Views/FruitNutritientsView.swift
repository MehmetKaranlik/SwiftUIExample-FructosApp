//
//  FruitNutritientsView.swift
//  Fructos
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct FruitNutritientsView: View {
    // MARK:  PROPERTIES
     var fruit: Fruit
    let nutrients : [String] = ["Energy","Sugar","Fat","Protein","Vitamin","Minerals"]
    // MARK:  BODY

    
    var body: some View {
        GroupBox {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0 ..< nutrients.count, id: \.self) { item in
                    Divider()
                    buildRow(item)
                }
            }
        }
    }
    
    
    
    fileprivate func buildRow(_ item: Int) -> some View {
        return HStack {
            Group {
                Image(systemName:"info.circle" )
                Text(nutrients[item]).bold()
            }
            .foregroundColor(fruit.gradientColors[1])
            
            Spacer()
            Text(fruit.nutrition[item])
                .fontWeight(.light)
                .font(.subheadline)
                .multilineTextAlignment(.trailing)
        }
    }


}


// MARK:  PREVIEW
struct FruitNutritientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutritientsView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
