//
//  Contacts.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI

//func displayedMessage(name: String) -> Text {
//    var user = Text("")
//
//    user = Text(name)
//        .font(.headline)
//    return user
//}

struct Contacts: View {
    var body: some View {
        List(contacts) { contact in
            HStack(){
                Image(contact.imageName)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 60, height: 60)
                    .clipped()
                    .cornerRadius(50)
                VStack(alignment: .leading, spacing: 50) {
                    Text(contact.name)
                        .font(.system(size: 21, weight: .medium, design: .default))
                    
                }
            }
            
        }
        .position(CGPoint(x: 200, y: 500))
        .flipsForRightToLeftLayoutDirection(true)
    }
}

#Preview {
    Contacts()
}
