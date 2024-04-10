//
//  SessionView.swift
//  Loch
//
//  Created by A P on 10/4/2024.
//

import SwiftUI
import Amplify

struct SessionView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let user: AuthUser
    
    var body: some View {
        Text("Works, L bozo, skill issue that you couldn't do this Penghus")
        Button("Sign Out", action:
            sessionManager.signOut)
    }
}

