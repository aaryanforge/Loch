//
//  MessagesPage.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

// Goal: Load from cache messages and dipslay them in ChatsBlockView
// For: Mark
// Due: Thursday 29 Mar

import SwiftUI

struct ChatsDetailView: View {

    // mark was here - loading the messages using Query attribute
    @Query private var messages: [ChatTextMessage]
    
    var body: some View {
        VStack {
            ChatsHeadView()
            LazyVStack {
                ChatsBlockView()
                ChatsBlockView()
                ChatsBlockView()
                /* Maxmimum of three chats, unless you pay up*/
            }
            // mark was here - loading the messages
            ForEach(messages) { message in
                VStack {
                    Text(message.messageContents)
                }
            }
            ChatsTailView()
        }
    }
}

#Preview {
    ChatsDetailView()
}
