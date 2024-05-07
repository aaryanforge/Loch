//
//  ConfirmationView.swift
//  Loch
//
//  Created by A P on 10/4/2024.
//

import SwiftUI
import Amplify

struct ConfirmationView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    let username: String
    @State var confirmationCode = ""
    
    var body: some View {
        Text("Username: \(username)")
        TextField("Confirmation Code", text: $confirmationCode)
        Button("Confirm", action: {sessionManager.confirm(username: username, code: confirmationCode)
        })
    }
}

#Preview {
    ConfirmationView(username: "DummyUser")
}
