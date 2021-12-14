//
//  SettingsScreen.swift
//  Fructos
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct SettingsScreen: View {
    // MARK:  PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    
    // MARK:  BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing:20) {
                    // MARK:  SECTION-1
                    GroupBox(
                        label:
                          SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    ){
                        Divider().padding(.vertical,4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Spacer()
                            Text("Most fruits are naturally low in fat, sodium and calories. None have cholesterol. Fruits are source of many essentail nutrients, including potassium, dietary fiber, vitamins and much more.")
                                .font(.footnote)
                                
                        }
                    }
                    
                    // MARK:  SECTION-2
                    // MARK:  SECTION-3
                }// MARK:  VSTACK
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems( trailing:Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.body)
                }))
            }// MARK:  Scroll
        }// MARK:  Navigation
    }
}


// MARK:  PREVIEW
struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
            .preferredColorScheme(.light)
    }
}
