//
//  Profile.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI

// Goal: Code and style the main profile view & link this view to ProfileDetailView
// For: Mary
// Due: Wednesday 28th Feb

//import Firebase
//
//struct Profile: View {
//    @State private var abtMe: String = ""
//    @State var aboutMeFinal: String = ""
//    @State var profName: String = ""
//    @State var profNick: String = ""
//    @State var profParent: String = ""
//    
//    var username = "Aaryan"
//    
//    var body: some View {
//        
//        VStack{
//            NavigationView() {
//                NavigationLink {
//                    Settings()
//                } label: {
//                    Text("Settings")
//                        .position(CGPoint(x: 325, y: 10))
//                }
//            }
//            Image("Connecting Image")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 150, height: 150)
//                .cornerRadius(150)
//                .shadow(radius: 3)
//            Text(profName)
//                .font(.title)
//                .fontWeight(.bold)
//                .task {
//                    profName = "e"
//                    profName = username
//                    
//                    for var prof in profData {
//                        if prof.name == username {
//                            profName = "Name: " + prof.name
//                            profNick = "Nickname: " + prof.nickname
//                            profParent = "Parent: " + prof.parent
//                            prof.aboutMe = ""
//                            print(prof.aboutMe)
//                        }
//                    }
//                }
//            Form {
//                HStack(){
//                    Text(profNick)
//                        .font(.title)
//                }
//                .padding()
//                HStack(){
//                    Text(profParent)
//                        .font(.title)
//                }
//                .padding()
//                HStack() {
//                    Text("About Me")
//                        .font(.title)
//                    TextField("About me", text: $abtMe, axis: .vertical)
//                        .onSubmit {
//                            aboutMeFinal = abtMe
//                        }
//                        .lineLimit(5)
//                        .background(
//                            RoundedRectangle(cornerRadius: 5)
//                                .strokeBorder(Color.primary.opacity(0.25), lineWidth: 2))
//                        .font(.title)
//                        .padding()
//                }
//                .padding()
//            }
//        }
//    }
//}
//
//#Preview {
//    Profile()
//}

struct ProfileMainView: View {
    var body: some View {
        VStack {
            // Mary's work
        }
    }
}
