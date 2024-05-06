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
    public let user: AuthUser
//    @State private var message: String = ""
//    @ObservedObject private var socketManager = SocketManager()
    
    var body: some View {
        Text("Works, L bozo, skill issue that you couldn't do this Penghus")
//            .task {
//                socketManager.start()
//                print("hi from task")
//            }
//        TextField("Message", text: $message)
//            .onSubmit {
//                message = ""
//                socketManager.send(msg: message)
//            }
        
        Button("Sign Out", action:
            sessionManager.signOut)
    }
    
    
}

