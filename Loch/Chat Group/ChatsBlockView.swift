//
//  MessageBlock.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

// Goal: Code and style chat block view
// For: Mary
// Due: Wednesday 28th Feb

import SwiftUI
import SwiftData
struct ChatsBlockView: View {
    // mark was here - loading the messages using Query attribute
    @Query private var messages: [ChatTextMessage]
    
    var body: some View {
        // mark was here - loading the messages
        ForEach(messages) { message in
            VStack {
                Text(message.messageContents)
            }
        }
        
        VStack {
            // Mary's work
        }
    }
}

#Preview {
    ChatsBlockView()
}
