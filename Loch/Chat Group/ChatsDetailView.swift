//
//  MessagesPage.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

// Goal: Load from cache messages and dipslay them in ChatsBlockView
// For: Mark
// Due: Thursday 29 Thu

import SwiftUI
import SwiftData

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
