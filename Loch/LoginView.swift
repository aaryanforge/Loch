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

struct LoginView: View {
    
    //@State private var isSignedOn = true
    @State private var manager = AuthenticationManager()
    @State private var newUserName = ""
    @State private var newEmail = ""
    @State private var newPassword = ""
    
    var body: some View {
        if manager.signedIn {
            Text(manager.userAttributes.first!.value)
        } else {
            VStack {
                Text("Email: ")
                TextField("Mail", text: $newEmail)
                Text("Username: ")
                TextField("Username", text: $newUserName)
                Text("Password: ")
                SecureField("Password", text: $newPassword)
                Divider()
                Button(action: {
                    Task {
                        await manager.signUp(username: newUserName, password: newPassword, email: newEmail)
                    }
                }, label: {
                Text("Signup")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.red)
                    .frame(width: 280, height: 50)
                    .padding()
                })
                Text("Just sign on...")
            }
        }
    }
}

#Preview {
    LoginView()
}
