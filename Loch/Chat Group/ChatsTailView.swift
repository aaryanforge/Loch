//
//  ChatsTailView.swift
//  Loch
//
//  Created by Phoenix Liu on 25/2/2024.
//

// Goal: Create a textfield that sends the user messages and cache to memory
// For: Mark
// Due: 29 Thu Feb

import SwiftUI

struct ChatsTailView: View {
    
    @State private var newTextMessage: String = ""
    
    var newMessage = ChatTextMessage(
        sender: 0,
        messageContents: "placeholder"
    )
    
    var body: some View {
        TextField(
            "New Text message",
            text: $newTextMessage
        )
        .autocorrectionDisabled(false)
    }
}

#Preview {
    ChatsTailView()
}
