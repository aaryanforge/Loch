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

struct ContactProfileHeader: View {
    var nickName: String

    var body: some View {
        VStack (alignment: .leading) {
            // back button
            Button {
                print("go back to prev")
            } label: {
                Image(systemName: "arrow.left")
            }
            .padding(5)

            Spacer()

            Text(nickName)
                .foregroundColor(.blackBlue800)
                .font(.system(size: 20,weight: .bold, design: .default))
                .padding(5)
                .padding([.trailing], 10)
            
            Button {
                print("open options")
            } label: {
                Image(systemName: "arrow.right") // placeholder until i find something better in apple's library
            }
            .padding(5)

        }
        .padding(10)
        .padding([.top])
        .frame(maxWidth: .infinity, minHeight: 50)
        .background(.green500)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ButtonSquareAlert: View {
    var todo: () -> Void
    var image: String
    var size: CGFloat

    var body: some View {
        Button {
            self.todo()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.redWarning)
                .frame(width: size, height: size)

                Image(systemName: image)
                    .foregroundColor(.white)
            }
        }
        .padding(2)
    }
}

// copied from profile main view with minor tweaks
struct ProfileAboutInfoContact: View {
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
                        ButtonSquare(todo: {print("Message")}, image: "message", size: 40)
                        ButtonSquare(todo: {print("Call")}, image: "phone.arrow.up.right", size: 40)
                        ButtonSquareAlert(todo: {print("sos")}, image: "sos", size: 40)
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

struct ContactsDetailView: View {
    
    var body: some View {
        VStack (alignment: .leading) {
            ContactProfileHeader(nickName: "Friend")

            // main profile section
            ProfileAboutInfoContact(profPicLink, "Connecting Image", name: "Do not Fear me", bio: ":              )")

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

                    ForumBlockPostPublicPrivate( 
                        imageLink: "Connecting Image", 
                        title: "HELLO WORLD",
                        //if this is throwing a bug you may have to put this all on 1 line
                        postContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 
                        postType: "pub"
                    )
                }
                .padding()
            }
        }
    }
    
}

#Preview {
    ContactsDetailView()
}


/* old code
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

*/