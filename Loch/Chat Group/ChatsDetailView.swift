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
import SwiftData


/* 
YourMessage: Displays the text messages you send in green (TBC)
@Params:
    message: String 
        Takes in a string for the message 
*/
struct YourMessage: View {
    var message: String
    var body: some View {
        ZStack(alignment: .trailing) {
            // Need to change text based on messages
            Text(message)
                .font(.system(size: 10 ,weight: .regular, design: .default))
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

/* 
TheirMessage: Displays the text messages you recieve in blue (TBC)
@Params:
    message: String 
        Takes in a string for the message 
*/
struct TheirMessage: View {
    var message: String

    var body: some View {
        ZStack(alignment: .leading) {
             // Need to change text based on messages
            Text(message)
                .font(.system(size: 10 ,weight: .regular, design: .default))
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

            //placeholder for now, please render theirmessage or yourmessage based on uid matching
            LazyVStack {
                TheirMessage(message: "Placeholder")
                YourMessage(message: "I want food")
            }

            // mark was here - loading the messages
            // ForEach(messages) { message in
            //     VStack {
            //         Text(message.messageContents)
            //     }
            // }
            //ChatsTailView()
        }
    }
}

#Preview {
    ChatsDetailView()
}
