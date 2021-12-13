//
//  SwiftUIView.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI


    

struct FruitCardView: View {
// MARK:  PROPERTIES
    @State private var isAnimating: Bool = false
    
// MARK:  BODY
    var body: some View {
        ZStack {
            VStack(spacing:20) {
                // MARK:  FRUIT IMAGE
                Image("blueberry")
                    .imageModifier(firstScale: 1, lastScale: 0.6, condition: isAnimating)
                    
                    
                // MARK:  FRUIT TITLE
                Text("Blueberry")
                    .titleModifier()
                    
                // MARK:  HEADLINE
                Text("Blueberries are sweet, nutritious and wildly popular fruit all over the world.")
                    .headlineModifier()
                   
               
                // MARK:  BUTTON
               StartButtonView()
            }// MARK:  VSTACK
        }   // MARK:  ZSTACK
        .zstackModifier()
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        })
        

        
        
   
    
    
    }
}



// MARK:  PREVIEW
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView().previewLayout(.fixed(width: 320, height: 640))
    }
}

fileprivate extension ZStack {
   
        func zstackModifier() -> some View {
            self
                .frame(minWidth: 0,  maxWidth:.infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(
                    LinearGradient(gradient: Gradient(colors:   [Color("ColorBlueberryLight") , Color("ColorBlueberryDark")]),  startPoint:.top, endPoint:.bottom))
                .cornerRadius(20)
        }
    }// MARK:  ZSTACK EXTENSION




 extension  Image {
     fileprivate  func imageModifier(firstScale : Double, lastScale: Double , condition:Bool) -> some View {
       return self
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.35),  radius: 8, x: 6, y: 0)
            .scaleEffect(condition ? firstScale : lastScale)
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
