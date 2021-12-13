//
//  FruitImageCardView.swift
//  Fructos
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct FruitImageCardView: View {
    let fruits : [Fruit] = fruitsData
    let width : CGFloat?
    let heigth : CGFloat?
    let  radius: CGFloat?
    let fruit :Fruit?
    @State private var isAnimating : Bool = false
    var body: some View {
     
    Image(fruit?.image == nil ? fruits[0].image : fruit!.image)
        .imageModifier(fruit: fruit ?? fruits[0],width: width ,height: heigth, radius: radius)
        .opacity(isAnimating ? 1 : 0)
        .onAppear {
            withAnimation(.easeOut(duration: 1)) {
                isAnimating = true
            }
        }
        
    }
}

struct FruitImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitImageCardView(width: .infinity  , heigth: 440, radius: 0 , fruit: nil)
            .previewLayout(.sizeThatFits)
    }
}

extension Image {
    func imageModifier(fruit: Fruit, width: CGFloat?, height:CGFloat? ,radius :CGFloat?) -> some View {
         @State  var isAnimating : Bool = false
        return self
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: width ?? 80, height: height ?? 80, alignment: .center)
            .shadow(color: Color(red: 0, green: 0, blue: 0 , opacity: 0.35), radius: 15, x: 6, y: 12 )
            .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
            
    
            }
         
        
    }

