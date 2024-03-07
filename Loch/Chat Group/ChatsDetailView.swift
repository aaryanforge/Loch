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


struct YourMessage: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            // Need to change text based on messages
            Text("I want food")
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .trailing)

        }
        //should add a property for ChatsTollbarView to be rendered onLongPressGesture
        .background(.green.opacity(0.5))
        .clipShape(
            .rect(
                topLeadingRadius: 15,
                bottomLeadingRadius: 15,
                bottomTrailingRadius: 0,
                topTrailingRadius: 15
            )
        )
    }
}

struct TheirMessage: View {
    var body: some View {
        ZStack(alignment: .leading) {
             // Need to change text based on messages
            Text("Placeholder")
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
        //should add a property for ChatsTollbarView to be rendered onLongPressGesture
        .background(.blue.opacity(0.5))
        .clipShape(
            .rect(
                topLeadingRadius: 15,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 15,
                topTrailingRadius: 15
            )
        )
    }
}


struct ChatsDetailView: View {

    // mark was here - loading the messages using Query attribute
    @Query private var messages: [ChatTextMessage]
    
    var body: some View {
        VStack {
            ChatsHeadView()
            LazyVStack {
                TheirMessage()
                YourMessage()
                /* Maxmimum of three chats, unless you pay up*/
            }

            // mark was here - loading the messages
            // mary - this should be moved to the block view, and it calls this which renders 
            // either theirmessage or ourmessage on determination of uid
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
