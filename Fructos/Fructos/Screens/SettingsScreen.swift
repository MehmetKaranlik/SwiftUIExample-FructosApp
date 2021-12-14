//
//  SettingsScreen.swift
//  Fructos
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct SettingsScreen: View {
    // MARK:  PROPERTIES
    @AppStorage("isOnboarding") var isFirstLaunch : Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    
    // MARK:  BODY

    

    

    
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing:20) {
                    buildTopFructusInfo()
                    buildCustomizationSection()
                    
                    buildMiddleApplicationInfo()
                }// MARK:  VSTACK
                .vstackModifier(presentationMode:presentationMode)
            }// MARK:  Scroll
        }// MARK:  Navigation
    }
    fileprivate func buildMiddleApplicationInfo() -> some View {
        return GroupBox(label:SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")) {
            
            SettingsRowView(name: "Developer", content: "Mehmet", icon: nil, linkLabel: nil, linkDestination: nil)
            SettingsRowView(name: "Designer", content: "Mehmet", icon: nil, linkLabel: nil, linkDestination: nil)
            SettingsRowView(name: "Compatibility", content: "iOS", icon: nil, linkLabel: nil, linkDestination: nil)
            SettingsRowView(name: "Website", content: nil, icon: "arrow.up.right.square", linkLabel: "Udemy", linkDestination: "udemy.com")
            SettingsRowView(name: "Twitter", content: nil, icon: "arrow.up.right.square", linkLabel: "Twitter", linkDestination: "https://twitter.com/RevolIstanbul")
            SettingsRowView(name: "Developer", content: "Mehmet", icon: nil, linkLabel: nil, linkDestination: nil)
            SettingsRowView(name: "SwiftUI", content: "5.0", icon: nil, linkLabel: nil, linkDestination: nil)
            SettingsRowView(name: "Version", content: "1.1.0", icon: nil, linkLabel: nil, linkDestination: nil)
        }
    }
    fileprivate func buildCustomizationSection() -> some View {
        return GroupBox(label:SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")) {
            Divider().padding(.vertical,4)
            Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onbarding process and you will see the welcome screen again.")
                .padding(.vertical,8)
                .frame(minHeight:60)
                .layoutPriority(1)
                .font(.footnote)
                .multilineTextAlignment(.leading)
            Toggle(isOn: $isFirstLaunch) {
                Text("Restrat".uppercased())
            }
            
        }
    }
    fileprivate func buildTopFructusInfo() -> some View {
        return GroupBox(label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle"))
        {
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
    }



}


// MARK:  PREVIEW
struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
            .preferredColorScheme(.dark)
    }
}



extension VStack {
    fileprivate func vstackModifier(presentationMode : Binding<PresentationMode>) -> some View {
        return self
            .navigationBarTitle("Settings", displayMode: .large)
            .navigationBarItems( trailing:Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.body)
            }))
}
}
