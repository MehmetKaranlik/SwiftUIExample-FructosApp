//
//  SwiftUIView.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI


    

struct FruitCardView: View {
// MARK:  PROPERTIES
    
    var fruit : Fruit
    
    @State private var isAnimating: Bool = false
    
// MARK:  BODY

    
    var body: some View {
        ZStack {
            _buildSomething()
           // MARK:  VSTACK
        }   // MARK:  ZSTACK
        .zstackModifier(
            color1: fruit.gradientColors[0],
            color2: fruit.gradientColors[1]
        )
        .onAppear {
            withAnimation(.easeOut(duration: 1)) {
                isAnimating = true
            }
        }
        
      
        

        
        
   
    
    
    }

    fileprivate func _buildSomething() -> some View {
        return VStack(spacing:20) {
                // MARK:  FRUIT IMAGE
            Image(fruit.image)
                .imageModifier(firstScale: 0.6, lastScale: 1, condition: isAnimating)
                // MARK:  FRUIT TITLE
            Text(fruit.title)
                .titleModifier()
                // MARK:  HEADLINE
            Text(fruit.headline)
                .headlineModifier()
                // MARK:  BUTTON
            StartButtonView()
        }
    }

}



// MARK:  PREVIEW
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[7])
            .previewLayout(
                .fixed(width: 320, height: 640))
    }
}

 private extension ZStack {
     func zstackModifier(color1:Color, color2:Color) -> some View {
            self
                .frame(minWidth: 0,  maxWidth:.infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color1 , color2]),  startPoint:.top, endPoint:.bottom))
                .cornerRadius(20)
                .padding(.horizontal,20)
                .padding(.vertical,15)
        }
    }// MARK:  ZSTACK EXTENSION




 extension  Image {
     fileprivate  func imageModifier(firstScale : Double, lastScale: Double , condition:Bool) -> some View {
       return self
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.35),  radius: 8, x: 6, y: 0)
            .scaleEffect(condition ? lastScale     : firstScale )
    }
     
//fileprivate func scaleModifier(firstScale: Double , lastScale: Double, condition:Bool) -> some View {
//        return self
//             .scaleEffect(condition ? lastScale : firstScale)
//     }
}// MARK:  IMAGE EXTENSION

 extension Text {
    fileprivate func titleModifier() -> some View {
        self
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.35), radius: 2, x: 2, y: 2)
    }
    
    fileprivate   func headlineModifier() -> some View {
        self
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal,16)
            .frame(maxWidth:480)
    }
}// MARK:  TEXT EXTENSION
