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
    @StateObject private var ChatMessageContentVM = MessageContentViewModel()
    
    func cacheNewMessage() async {
        // use URLSession API call to see whether to cache the message or not
        // guard that the message classification is a 1, else cache message
        
        await ChatMessageContentVM.getData(messageContents: newTextMessage)
        
        let messageClassification: String? = ChatMessageContentVM.classification
        
        if (messageClassification == "0") {
            let newMessage = ChatTextMessage(
                senderID: UUID().uuidString,
                messageContents: newTextMessage
            )
            context.insert(newMessage)
        }
    }
    
    var body: some View {
        TextField(
            "New Text message",
            text: $newTextMessage
        )
        .autocorrectionDisabled(false)

        // create some send button here to activate cacheNewMessage function
        Button(action: {
            Task {
                await cacheNewMessage()
            }
        }, label: {
            Text("<Send Message>") // replace with actual button UI
        })
    }
}

#Preview {
    ChatsTailView()
}
