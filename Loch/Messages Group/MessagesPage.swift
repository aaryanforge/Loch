//
//  MessagesPage.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

import SwiftUI

struct currentMsgs {
    var cMsg: String
}

struct MessagesPage: View {
    var msg: messagesData
    @StateObject private var messagesManager = MessagesManager()
    @State private var txtMsg: String = ""
    
    var body: some View {
        VStack (alignment: .leading) {
//            MessageBlock(message: Message(body: "Hello, I'm Penghus Khan", sent: true, timeStamp: Date.now))
//            MessageBlock(message: Message(id: UUID(2), body: "Hello, I'm Aaryan Pala", sent: false, timeStamp: Date.now))
//            MessageBlock(message: Message(body: "Hello, I'm Marcus Aurelius", sent: false, timeStamp: Date.now))
//            MessageBlock(message: Message(body: "Hello, I'm Gene Truong", sent: false, timeStamp: Date.now))
            ForEach(messagesManager.messages, id: \.id) { message in
                MessageBlock(message: message)
            }
            TextField("Message @" + msg.name, text: $txtMsg)
                .onSubmit {
                    txtMsg = ""
                }
                .border(Color.black)
        }
        
    }
}
