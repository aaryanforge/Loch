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
    
    @State private var isSignedOn = true
    
    var body: some View {
        if isSignedOn == false {
            VStack {
                Text("Just sign on...")
            }
        } else {
            ContentView()
        }
    }
}

#Preview {
    LoginView()
}
