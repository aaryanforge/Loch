//
//  Profile.swift 
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
        VStack {
            Text(nickName)
                .foregroundColor(.blackBlue800)
                .font(.system(size: 20,weight: .bold, design: .default))
        }
        .padding(10)
        .padding([.top])
        .frame(maxWidth: .infinity, minHeight: 50)
        .background(.green500)
        .edgesIgnoringSafeArea(.top)
    }
}


struct ProfilePictureCircle: View {
    var imageLink: String?
    var size: CGFloat
    var hasBorder: Bool

    var body: some View {
        ZStack {
            if (imageLink != nil){
                Image(imageLink!)
                    .resizable()
                    .aspectRatio(CGSize(width:1, height: 1), contentMode: .fit)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            } else {
                Image(systemName:  "person.fill")
                    .resizable()
                    .aspectRatio(CGSize(width:1, height: 1), contentMode: .fit)
                    .frame(width: size * 0.8, height: size * 0.8)
                    .clipShape(Circle())
            }

            if (hasBorder){
                Circle()
                    .strokeBorder(.green500, style:
                                    StrokeStyle(lineWidth: 2, miterLimit: 10, dash: [8, 5], dashPhase: 0)
                    )
            }
        }
        .frame(width: size, height: size)
    }
}

struct ButtonSquare: View {
    var todo: () -> Void
    var image: String
    var size: CGFloat

    var body: some View {
        Button {
            self.todo()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.green500)
                .frame(width: size, height: size)

                Image(systemName: image)
                    .foregroundColor(.white)
            }
        }
        .padding(2)
    }
}
struct ProfileAboutInfo: View {
    var profPicLink: String?
    var name: String
    var bio: String

    var body: some View {
        VStack{
            // top half of profile banner
            HStack {
                ProfilePictureCircle(size: 130, hasBorder: true )
                    .padding([.bottom], 10)
                    .padding([.top], 5)
                    .padding([.trailing], 8)

                //name and buttons
                VStack(alignment: .leading){
                    Text("AKA")
                        .foregroundColor(.grey800)
                        .font(.system(size: 14,weight: .medium, design: .default))
                        .padding([.bottom], 1)
                    Text(name)
                        .foregroundColor(.blackBlue800)
                        .font(.system(size: 17,weight: .semibold, design: .default))
                        .padding([.bottom], 10)

                    HStack {
                        ButtonSquare(todo: {print("Edit")}, image: "square.and.pencil", size: 40)
                        ButtonSquare(todo: {print("Notifications")}, image: "bell", size: 40)
                    }

                }
                .padding()
            }
            //bio part

            Text(bio)
                .foregroundColor(.blackBlue800)
                .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                .padding(15)
                .background(.green500.opacity(0.2)).clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(10)
        .padding([.bottom], 10)
    }
}

struct ProfileMainView: View {
    var body: some View {
        VStack (alignment: .leading) {
            ProfileHeader(nickName: "Lochie")

            // main profile section
            ProfileAboutInfo(profPicLink, "Connecting Image", name: "Lochilon Ness", bio: "peepee poopoo")

            //forum posts
            // should be renedered in reverse chronilogical order, with the newest ones first

            Text("Forum Posts:")
                .font(.subheadline)
                .foregroundColor(.grey800)
                .padding(5)
                .padding([.leading])
            
            ScrollView([.vertical]) {
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
                .padding()
            }
        }
    }
}
