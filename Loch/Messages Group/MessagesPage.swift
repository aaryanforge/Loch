//
//  MessagesPage.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

import SwiftUI
import FirebaseFirestore

//struct currentMsgs {
//    var cMsg: String
//}

struct MessagesPage: View {
    var chatRoom: ChatRoom
    let db = Firestore.firestore()
    
    
    //private var messagesManager: MessagesManager
    @MainActor func getMessagesHistory(chatRoomId: String) -> MessagesManager {
        return MessagesManager(chatRoomId: chatRoomId)
    }
    
    @State private var txtMsg: String = ""
    
    
    
    var body: some View {
        VStack (alignment: .leading) {
//            MessageBlock(message: Message(body: "Hello, I'm Penghus Khan", sent: true, timeStamp: Date.now))
//            MessageBlock(message: Message(id: UUID(2), body: "Hello, I'm Aaryan Pala", sent: false, timeStamp: Date.now))
//            MessageBlock(message: Message(body: "Hello, I'm Marcus Aurelius", sent: false, timeStamp: Date.now))
//            MessageBlock(message: Message(body: "Hello, I'm Gene Truong", sent: false, timeStamp: Date.now))
            Image("Connecting Image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(50)
            Divider()
            //await getMessagesHistory(chatRoomId: msg.id)
            ForEach(getMessagesHistory(chatRoomId: chatRoom.id!).messages, id: \.id) { message in
                MessageBlock(message: message)
            }
//            .task {
//                messagesManager = MessagesManager(chatRoomId: msg.id)
//            }
            TextField("Message @" + chatRoom.name, text: $txtMsg)
                .onSubmit {
                    db.collection("chatRoom").document(chatRoom.id!).collection("messages").addDocument(data: [
                        "body": txtMsg,
                        "sent": true,
                        "timeStamp": Date.now,
                    ])
                    txtMsg = ""
                }
                .border(Color.black)
        }
        
    }
}
