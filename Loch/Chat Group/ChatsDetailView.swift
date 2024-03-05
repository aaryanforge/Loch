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
    var body: some View {
        VStack {
            ChatsHeadView()
            LazyVStack {
                ChatsBlockView()
                ChatsBlockView()
                ChatsBlockView()
                /* Maxmimum of three chats, unless you pay up*/
            }
            ChatsTailView()
        }
    }
}

#Preview {
    ChatsDetailView()
}
