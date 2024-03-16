//
//  AuthenticationManager.swift
//  Loch
//
//  Created by Phoenix Liu on 15/3/2024.
//

import Foundation
import Amplify

class AuthenticationManager: ObservableObject {
    @Published var userAttributes: [AuthUserAttribute] = []
    
    func signUp(username: String, password: String, email: String) async {
        let userAttributes = [AuthUserAttribute(.preferredUsername, value: username)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        do {
            let signupResult = try await Amplify.Auth.signUp(
                username: email,
                password: password,
                options: options
            )
            print("You've signed up!")
        } catch {
            print("Failed to sign up with error: \(error)")
        }
    }
    
    func signIn(email: String) async {
        do {
            let signupResult = try await Amplify.Auth.signIn(username: email)
        } catch let error as AuthError {
            print("Authentication failed with error: \(error)")
        } catch {
            print("Other error: \(error)")
        }
    }
    
    func fetchUserData(email: String) async {
        do {
            let userAttributes = try await Amplify.Auth.fetchUserAttributes()
        } catch {
            print("Could not fetch user data, error: \(error)")
        }
    }
}

