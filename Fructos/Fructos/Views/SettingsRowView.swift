//
//  SettingsRowView.swift
//  Fructos
//
//  Created by mehmet karanlık on 14.12.2021.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK:  properties
    let name:String
    let content:String?
    let icon:String?
    let linkLabel:String?
    let linkDestination:String?
    
    // MARK:  body

    
    var body: some View {
        VStack {
            Divider().padding(.vertical,4)
            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if linkLabel != nil && linkDestination != nil {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    
                }else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
                buildComponentIcon(icon: icon)
                    
            }
        }
    }
    
    
    
    fileprivate func buildComponentIcon(icon:String?) -> some View {
        VStack {
    if icon != nil {
    Image(systemName: icon!)
            .font(.title2)
    } else {
        /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
    }

}


// MARK:  preview
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(
                name: "Developer",
                content: "Jane/July",
                icon: "person.circle",
                linkLabel: nil,
                linkDestination: nil)
                .previewLayout(
                    .fixed(width: 375, height: 60))
                .padding()
                .preferredColorScheme(.dark)
            SettingsRowView(
                            name: "Website",
                            content: nil,
                            icon: "arrow.up.right.square",
                            linkLabel: "Go to Website",
                            linkDestination: "udemy.com")
                .previewLayout(
                    .fixed(width: 375, height: 60))
                .padding().preferredColorScheme(.dark)
            SettingsRowView(
                name: "Sample",
                content: "Sample",
                icon: nil,
                linkLabel: nil,
                linkDestination: nil)
                .previewLayout(
                    .fixed(width: 375, height: 60))
                .padding().preferredColorScheme(.dark)
        }
    }
}
