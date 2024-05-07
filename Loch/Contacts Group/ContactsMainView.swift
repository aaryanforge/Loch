//
//  Contacts.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

// Goal: revamp the contacts main page, modelling the looks from the figma prototype
// For: Mark
// Due: Thursday 14th Mar

import SwiftUI

struct ContactItem: View {
    //var uid : Int   please change when avaliable 

    var body: some View {
        HStack {
            ProfilePictureCircle(size: 80, hasBorder: true)
                .padding(8)

            Text("Nickname here")
                .padding(8)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
        .padding(5)
    }

}

struct ContactsMainView: View {
    @State private var isAddingUser = false

    var body: some View {
        
        VStack {
            HStack {
                Text("Contacts")
                    .padding(10)                
                    .font(.system(size: 25,weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .edgesIgnoringSafeArea(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.green)
            
            //bloop here is a change please update
            
            
            VStack (spacing: 0) {
                ScrollView ([.vertical]) {
                    ContactItem()
                    ContactItem()
                    ContactItem()
                    ContactItem()
                    ContactItem()
                    ContactItem()
                }
                .padding([.top], 10)
                
            }
        }
    }
}

#Preview {
    ContactsMainView()
}


/* Old code
NavigationView() {
            Image("Thomas")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            List {
                NavigationView() {
                    NavigationLink(destination: ContactsDetailView()) {ContactItem()}
                    NavigationLink(destination: ContactsDetailView()) {ContactItem()}
                    NavigationLink(destination: ContactsDetailView()) {ContactItem()}
                    NavigationLink(destination: ContactsDetailView()) {ContactItem()}
                    NavigationLink(destination: ContactsDetailView()) {ContactItem()}
                }
                NavigationLink(destination: ContactsDetailView()) {
                    HStack(){
                        Image("Connecting Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(50)
                        VStack(alignment: .leading, spacing: 50) {
                            Text("Contact Name")
                                .font(.system(size: 21, weight: .medium, design: .default))
                        }
                    }
                }
            }
            .navigationTitle("Contacts")
            
*/
