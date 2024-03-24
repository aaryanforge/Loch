//
//  Detailed View.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

// Goal: Build an interface based on the figma
// For: Mark
// Due: Thursday 14th Mar

import SwiftUI

struct ContactsDetailView: View {
    
    var body: some View {
        VStack{
            Image("Connecting Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .shadow(radius: 3)
            Text("Phoenix Liu")
                .font(.title)
                .fontWeight(.bold)
            Form {
                HStack(){
                    Text("Name")
                        .underline()
                    Spacer()
                    Text("Phoenix")
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                HStack(){
                    Text("Nickname")
                        .underline()
                    Spacer()
                    Text("Penghus")
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("About Me:")
                            .underline()
                        Spacer()
                        Text("I love cheese")
                            .foregroundColor(.black)
                            .font(.callout)
                    }
                }
                
                Section {
                    Button(action: { }) {
                        Text("Send Message")
                    }
                }
            }
        }
    }
}

#Preview {
    ContactsDetailView()
}
