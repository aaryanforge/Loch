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
    @StateObject var ChatMessageContentVM = MessageContentViewModel()

    func cacheNewMessage() async {
        // use URLSession API call to see whether to cache the message or not
        // guard that the message classification is a 1, else cache message
        
        var messageClassification = await ChatMessageContentVM.getData(newTextMessage)

        if (messageClassification == "0") {
            var newMessage = ChatTextMessage(
                senderID: UUID().uuidString,
                messageContents: newTextMessage
            )
            context.insert(newMessage)
        }
    }
    
    var body: some View {
         TextField(
            "Message...", 
            text: $newTextMessage
        )
        .padding(20)
        .foregroundColor(.white)
        .background(.grey, in: RoundeRectangle (cornerRadius: 20, style: .continuous))
        .autocorrectionDisabled(false)

        Button(action: {
            Task {
                await cacheNewMessage()
            }
        }, label: {
            //is there any way to call the await elsewhere or does it have to be in this function?
            Image (systemname: "arrowtriangle.forward.fill") 
            .foregroundColor(.white)
        })
        .padding()
    }
}

#Preview {
    ChatsTailView()
}
