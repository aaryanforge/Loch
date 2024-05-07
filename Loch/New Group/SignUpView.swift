//
//  SignUpView.swift
//  Loch
//
//  Created by A P on 10/4/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack() {
            Text("Sign up view")
            TextField("Username", text: $username)
            TextField("Password", text: $password)
            TextField("Email", text: $email)
            
            Button("Sign up", action: {
                sessionManager.signUp(username: username, password: password, email: email)
            })
            Button("Log in", action: {sessionManager.showLogin()})
        }
    }
}

#Preview {
    SignUpView()
}
