//
//  Detailed View.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

import SwiftUI

struct Detailed_View: View {
    
    let contact: contactData
    
    var body: some View {
        VStack{
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .shadow(radius: 3)
            Text(contact.name)
                .font(.title)
                .fontWeight(.bold)
            Form {
                HStack(){
                    Text("Name")
                        .underline()
                    Spacer()
                    Text(contact.name)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                HStack(){
                    Text("Nickname")
                        .underline()
                    Spacer()
                    Text(contact.nickname)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("About Me:")
                            .underline()
                        
                        Spacer()
                        if contact.name == "Aaryan" {
                            Text(profData[0].aboutMe)
                                .foregroundColor(.black)
                                .font(.callout)
                                .task {
                                    for var prof in profData {
                                        print(prof.aboutMe) //tf glitch in the matrix - why isn't this showing the abbout me but in the other page it does despite them being the exact same data.
                                        print(prof.name)
                                        print("yesSIR")
                                        print(profData[0].aboutMe)
                                    }
                                    
                                }
                        } else {
                            Text(contact.aboutMe)
                                .foregroundColor(.black)
                                .font(.callout)
                        }
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
    Detailed_View(contact: contacts[0])
}
