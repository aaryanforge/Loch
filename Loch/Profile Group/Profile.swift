//
//  Profile.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI

struct Profile: View {
    @State private var abtMe: String = ""
    @State var aboutMeFinal: String = ""
    @State var profName: String = ""
    @State var profNick: String = ""
    @State var profParent: String = "Parent: ur mom"
    
    var username = "Aaryan"


    var body: some View {
        
        
        
        
        VStack{
            
            
            
//            NavigationView() {
//                NavigationLink {
//                    Settings()
//                } label: {
//                    Text("Settings")
//                        .position(CGPoint(x: 325, y: 10))
//                }
//            }
            Image("Connecting Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(150)
                .shadow(radius: 3)
            Text(profName)
                .font(.title)
                .fontWeight(.bold)
                .task {
                    profName = "e"
                    profName = username
                    
                    for var prof in profData {
                        if prof.name == username {
                            profName = "Name: " + prof.name
                            profNick = "Nickname: " + prof.nickname
                            prof.aboutMe = "kjhjkhkjhk"
                            print(prof.aboutMe)
                        }
                    }

                    
                }
            Text(profNick)
            Text(profParent)
            
            TextField("About me", text: $abtMe, axis: .vertical)
                .onSubmit {
                    aboutMeFinal = abtMe
                }
            Text(profNick)
            Text(profParent)
            
            TextField("About me", text: $abtMe, axis: .vertical)
                .onSubmit {
                    aboutMeFinal = abtMe
                }
                .lineLimit(3)
                //.frame(width: 350, height: 30)
                //.multilineTextAlignment(.center)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color.primary.opacity(0.25), lineWidth: 2))
                    .padding()
                
        }
    }
}

#Preview {
    Profile()
}
