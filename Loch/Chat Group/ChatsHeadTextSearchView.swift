//
//  ChatsHeadTextSearchView.swift
//  Loch
//
//  Created by Mark on 7/3/2024.
//

import Foundation
import SwiftUI
import SwiftData

// This is the view for the sheet when searching for texts
struct ChatsHeadTextSearchView: View {
    
    @State private var textSearch = ""
    
    @Query private var messages: [ChatTextMessage]
    @State private var filteredUserMessages: [ChatTextMessage]
    @State private var userMessages: [ChatTextMessage]
    
    var body: some View {
        VStack(spacing: 10) {
            // some code
            TextField(
                "SearchQuery",
                text: $textSearch
            )
            .frame(alignment: .top)
            
            Button {
                Task {
                    userMessages = await getCurrentUserCachedMessages(
                        of: "currentUserUUID",
                        using: messages)
                    
                    filteredUserMessages = await getMessagesFromQuery(
                        find: textSearch,
                        from: userMessages)
                }
            } label: {
                Text("Search")
            }
        }
        ForEach(filteredUserMessages) { message in
            VStack {
                Text(message.messageContents)
            }
        }
    }
}

// returns a list of messages that belong to the current user
func getCurrentUserCachedMessages(of currentUserID: String, using allMessages: [ChatTextMessage]) async -> [ChatTextMessage] {
    
    var messages: [ChatTextMessage] = []
    
    for message in allMessages {
        if (message.senderID == currentUserID) {
            messages.append(message)
        }
    }
    return messages
}

// finds and returns the message from a serach query
func getMessagesFromQuery(find messageQuery: String, from messages: [ChatTextMessage]) async -> [ChatTextMessage] {
    
    var filteredMessages: [ChatTextMessage] = []
    
    for message in messages {
        if message.messageContents.localizedCaseInsensitiveContains(messageQuery) {
            filteredMessages.append(message)
        }
    }
    return filteredMessages
}

