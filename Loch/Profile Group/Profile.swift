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
            Text("Name")
                .font(.title)
                .fontWeight(.bold)
            Text("Nickname")
            Text("Parent")
            
            TextField("About me", text: $abtMe, axis: .vertical)
                .onSubmit {
                    aboutMeFinal = abtMe
                    
                    List(profData) { prof in
                        if prof.name == "Aaryan" {
                            //prof.aboutMe = aboutMeFinal
                        }
                    }
                }
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
