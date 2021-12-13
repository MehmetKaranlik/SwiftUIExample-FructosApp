//
//  StartButtonView.swift
//  Fructos
//
//  Created by mehmet karanlık on 13.12.2021.
//

import SwiftUI

struct StartButtonView: View {
    // MARK:  PROPERTIES
    
    
    // MARK:  BODY
    var body: some View {
        Button {
            print("exit")
        } label: {
            HStack(spacing:8) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .hstackModifier()
            
        } // MARK:  BUTTON
        .accentColor(.white)
    }
}

// MARK:  PREVIEW
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView().preferredColorScheme(.dark).previewLayout(.sizeThatFits)
    }
}

  extension HStack {
   fileprivate func hstackModifier() -> some View {
        self
            .padding(.horizontal,16)
             .padding(.vertical,10)
             .background(Capsule()
                            .strokeBorder(
                                .white,lineWidth: 1.25))
    }
}
