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
import SwiftData

struct ChatsTailView: View {
    
    @Environment(\.modelContext) private var context
    @State private var newTextMessage: String = ""
    
    func cacheNewMessage() {
        var newMessage = ChatTextMessage(
            senderID: UUID().uuidString,
            messageContents: newTextMessage
        )
        context.insert(newMessage)
    }
    
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
