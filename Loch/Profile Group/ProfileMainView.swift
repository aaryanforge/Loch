//
//  Profile.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

// Goal: Create the page the user sees when they tap on the profile tab
// For: Mary
// Due: Thursday 14th Mar

import SwiftUI

struct ProfileHeader: View {
    var nickName: String

    var body: some View {
        HStack {
            Spacer()
            Text(nickName)
                .foregroundColor(.black)
                .font(.system(size: 20,weight: .bold, design: .default))
            Spacer()
        }
        .padding(10)
        .frame(minHeight: 50)
        .background(.green)
    }
}


struct ProfilePictureCircle: View {
    var imageLink: String?
    var size: CGFloat
    var hasBorder: Bool

    var body: some View {
        ZStack {

            if (imageLink != nil){
                Image(imageLink)
                    .resizable()
                    .aspectRatio(CGSize(width:1, height: 1), contentMode: .fit)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            } else {
                Image(systemName:  "person.fill")
                    .resizable()
                    .aspectRatio(CGSize(width:1, height: 1), contentMode: .fit)
                    .frame(width: size, height: size)
                    .clipShape(Circle())

            }

            if (hasBorder){
                Circle()
                    .strokeBorder(.green, style:
                        StrokeStyle(lineWidth: 1.5, miterLimit: 10, dash: [20, 5], dashPhase: 5)
                    )
            }
        }
        .frame(width: size, height: size)
    }
}

struct ButtonSquare: View {
    var todo: () -> Void
    var actionName: String
    var image: String
    var size: CGFloat

    var body: some View {
        Button {
            self.todo()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .background(.green)
                Label(actionName, systemImage: image)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: size)
        }
        .padding(8)
    }
}

struct ProfileAboutInfo: View {
    var profPicLink: String
    var name: String
    var bio: String

    var body: some View {
        VStack{

            // top half of profile banner
            HStack {
                ProfilePictureCircle(imageLink: profPicLink, size: 120, hasBorder: true)
                .padding()

                //name and buttons
                VStack{
                    Text("AKA")
                        .foregroundColor(.gray)
                        .font(.system(size: 14,weight: .medium, design: .default))
                        .padding(8)
                    Text(name)
                        .foregroundColor(.black)
                        .font(.system(size: 17,weight: .semibold, design: .default))
                        .padding(10)
                    
                    HStack {
                        ButtonSquare(todo: {print("Edit")}, actionName: "Edit", image: "square.and.pencil", size: 40)
                        ButtonSquare(todo: {print("Notifications")}, actionName: "Notifications", image: "bell", size: 40)
                    }

                }
                .padding()

                //bio part
                Text(bio)
                    .foregroundColor(.black)
                    .frame(maxWidth: 130)
                    .background(.green.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(10)
            }
        }
    }
}

struct ProfileMainView: View {
    var body: some View {
        VStack {
            ProfileHeader(nickName: "Lochie")

            // main profile section
            ProfileAboutInfo(profPicLink: "Connecting Image", name: "Lochilon Ness", bio: "peepee poopoo")

            //forum posts
            // should be renedered in reverse chronilogical order, with the newest ones first
            LazyVStack{
            ForumBlockPostPublicPrivate(
                imageLink: "Connecting Image", 
                title: "HELLO WORLD",
                //if this is throwing a bug you may have to put this all on 1 line
                postContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
                postType: "priv"
            )

            ForumBlockPostPublicPrivate(
                title: "Homework Help Q4",
                postContent: "Can anybody help out with my maths homework??? \nI don't get Question 4", 
                postType: "priv"
            )
            }
        }
    }
}
