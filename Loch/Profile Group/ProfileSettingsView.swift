//
//  ProfileDetailView.swift
//  Loch
//
//  Created by Phoenix Liu on 25/2/2024.
//

import SwiftUI

// Goal: Code and style the form for editing the user's profile
// For: Mary
// Due: Thursday 14th Mar


func goBack() { print ("goBack") }
func submit() { print ("submit") }

struct AvatarSection: View {
    var profPicLink: String

    var body: some View {
        VStack{
            ZStack {

                //profile picture
                ProfilePictureCircle(imageLink: profPicLink, size: 120, hasBorder: true)
                    .padding()

                // grey overlay
                Circle()
                    .fill(.black.opacity(0.2))
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.white)
            }
            .padding(10)

            Text("Edit Avatar")
                .foregroundColor(.green)
                .font(.system(size: 8 ,weight: .light, design: .default))
        }
        .padding()
    }
}

struct ProfileDetailView: View {
    @State private var nickname: String = ""
    @State private var realName: String = ""
    @State private var bio: String = ""

    var body: some View {
        VStack {
            VStack (alingment: left) {
                //back button
                Button {
                    goBack()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.gray)
                }
                .padding(8)
            }

            AvatarSection(profPicLink: "Connecting Image")

            //text enter fields
            VStack {
                //Nickname
                VStack (alignment: .leading){
                    Text("Nickname")
                        .foregroundColor(.green)
                        .font(.system(size: 15 ,weight: .regular, design: .default))
                        .padding(5)

                    TextField(
                        "Lochie",
                        text: $nickname 
                    )
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.green.opacity(0.2), in: RoundedRectangle (cornerRadius: 8, style: .continuous))
                        .autocorrectionDisabled(false)
                }
                .padding()

                //Real Name
                VStack (alignment: .leading){
                    Text("Real Name")
                        .foregroundColor(.green)
                        .font(.system(size: 15 ,weight: .regular, design: .default))
                        .padding(5)
                
                    TextField(
                        "Lochilon Ness",
                        text: $realName
                    )
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.green.opacity(0.2), in: RoundedRectangle (cornerRadius: 8, style: .continuous))
                        .autocorrectionDisabled(false)
                }
                .padding()

                //Bio
                VStack (alignment: .leading){
                    Text("About You")
                        .foregroundColor(.green)
                        .font(.system(size: 15 ,weight: .regular, design: .default))
                        .padding(5)
                
                    TextField(
                        "blah blach",
                        text: $bio
                    )
                        .padding(10)
                        .frame(maxHeight: 100, alignment: .top)
                        .foregroundColor(.white)
                        .background(.green.opacity(0.2), in: RoundedRectangle (cornerRadius: 8, style: .continuous))
                        .autocorrectionDisabled(false)
                }
                .padding()
            }

            //submit button
           Button {
                    submit()
                } label: {
                    ZStack{
                        RoundedRectangle (cornerRadius: 8, style: .continuous)
                            .fill(.green)
                        Text("Submit")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: 80, maxHeight: 50)
                }
                .padding(8)

        }
        .padding()
        
    }
}

#Preview {
    ProfileDetailView()
}
