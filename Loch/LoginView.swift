//
//  LoginView.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

// Goal: Implement the looks of prototype login page, including animation, in Swift
// For: Mary
// Due: Thursday 14th Mar

import SwiftUI

struct ButtonInit: View {
    var todo: () -> Void
    var actionName: String
    var bgColor: Color

    var body: some View {
        Button {
            self.todo()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(bgColor)
                    .frame(width: 120, height: 80)

                Text(actionName)
                    .font(.system(size: 25 ,weight: .semibold, design: .default))
            }
        }
        .padding()
    }
}

struct LoginView: View {
    
    @State private var isSignedOn = true
    
    var body: some View {
        if isSignedOn == false {
            ZStack {
                LinearGradient(colours: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                
                //details
                VStack {
                    Text("Loch")
                        .font(.system(size: 45 ,weight: .bold, design: .default))
                        .padding()

                    //replace with logo
                    ProfilePictureCircle(imageLink: "Connecting Image",size: 250, hasBorder: true )
                    
                    Spacer()

                    //sign up button
                    ButtonInit(todo: {print("sign up")}, actionName: "Sign Up", bgColor: .teal)
                    //log in button
                    ButtonInit(todo: {isSignedOn.toggle()}, actionName: "Log In", bgColor: .green)
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        } else {
            ContentView()
        }
    }
}

#Preview {
    LoginView()
}
