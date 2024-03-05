//
//  ChatsHeadView.swift
//  Loch
//
//  Created by Phoenix Liu on 25/2/2024.
//

// Goal: Create an unstyled search box. When the user enters a query in the search box and presses enter, the ChatsDetailView page should load up the relevant texts
// For: Mark
// Due: Thursday 7th March

import SwiftUI
import SwiftData

struct ChatsHeadView: View {
    
    @State private var textSearch = ""
    @Query private var messages: [ChatTextMessage]
    
    // TODO: as messages from every person is cached, figure out a way to filter messages of the current person user is talking to
    
    var body: some View {
        TextField(
            "SearchQuery",
            text: $textSearch
        )
        
        Button {
            // do something
        } label: {
            Text("<Enter>") // make into actual UI
        }

    }
}

#Preview {
    ChatsHeadView()
}

// returns a list of messages that belong to the current user
func getCurrentUserCachedMessages(of currentUserID: UUID, using allMessages: [ChatTextMessage]) -> [ChatTextMessage] {
    
    return []
}

// finds and returns the message from a serach query
func getMessagesFromQuery(find messageQuery: String, from messages: [ChatTextMessage]) /*-> ChatTextMessage*/ {
    
    return
}
