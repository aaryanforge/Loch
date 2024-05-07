//
//  Authenticator.swift
//  Loch
//
//  Created by A P on 10/4/2024.
//

import SwiftUI
import Amplify
import AmplifyPlugins

@main
struct Authenticator: App {
    
    @ObservedObject var sessionManager = SessionManager()
    
    init() {
        configureAmplify()
        sessionManager.getCurrentAuthUser()
    }
    
    
    var body: some Scene {
        WindowGroup {
            switch sessionManager.authState {
            case .login:
                LoginView()
                    .environmentObject(sessionManager)
            case .signUp:
                SignUpView()
                    .environmentObject(sessionManager)
            case .confirmCode(let username):
                ConfirmationView(username: username)
                    .environmentObject(sessionManager)
            case .session(let user):
                SessionView(user: user)
                    .environmentObject(sessionManager)
            }
            ContentView()
        }
    }
    
    private func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Amplify configured successfully")
        } catch {
            print("Could not initialise Amplify", error)
        }
    }
}

