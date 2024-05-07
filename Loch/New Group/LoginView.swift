//
//  LoginView.swift
//  Loch
//
//  Created by A P on 10/4/2024.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        TextField("Username", text: $username)
        TextField("Password", text: $password)
        
        Button("Login", action:{ sessionManager.login(username: username, password: password)})
        Button("Sign up", action: sessionManager.showSignUp)
    }
}

#Preview {
    LoginView()
}
