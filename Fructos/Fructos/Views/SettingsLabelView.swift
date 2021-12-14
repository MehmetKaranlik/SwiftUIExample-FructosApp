//
//  SettingsLabelView.swift
//  Fructos
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK:  Properties
     var labelText:String
     var labelImage:String
    
    
    // MARK:  body
    var body: some View {
        HStack {
        Text(labelText.uppercased()).fontWeight(.bold)
        Spacer()
        Image(systemName: labelImage)
    }
    }
}



// MARK:  preview
struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
    }
}
