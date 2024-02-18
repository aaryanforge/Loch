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
    @State private var isAddingUser = false
    var body: some View {
        NavigationView() {
            Image("Thomas")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .sheet(isPresented: $isAddingUser, content: {
                    AddContactSheet()
                })
                .onTapGesture {
                    isAddingUser = true
                }
            List(contacts) { contact in
                NavigationLink(destination: Detailed_View(contact: contact)) {
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
            }
            .navigationTitle("Contacts")
        }
    }
}

#Preview {
    Contacts()
}
