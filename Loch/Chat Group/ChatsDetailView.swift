//
//  MessagesPage.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

// Goal: Load from cache messages and dipslay them in ChatsBlockView
// For: Mark
// Due: Thursday 7th March

// Goal: Create an unstyled search box. When the user enters a query in the search box and presses enter, the ChatsDetailView page should load up the relevant texts
// For: Mark
// Due: Thursday 7th March

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
