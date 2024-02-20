//
//  MessagesManager.swift
//  Loch
//
//  Created by Phoenix Liu on 18/2/2024.
//

import Foundation
import FirebaseFirestore
import SwiftUI

@MainActor class MessagesManager: ObservableObject {
    
    let chatRoomId: String
    let db = Firestore.firestore()
    @Published private(set) var messages: [Message] = []
    
    init(chatRoomId: String)  {
        self.chatRoomId = chatRoomId
        Task {
            await getMessages()
        }
    }
    
    func getMessages() async {
        do {
            // for chatRoom in loggedInUser.chatRooms {
                let snapshot = try await db.collection("chatRoom").document(chatRoomId).collection("messages").order(by: "timeStamp").getDocuments()
                for message in snapshot.documents {
                    try messages.append(message.data(as: Message.self))
                }
            //}
            
        } catch {
            print("ERR: \(error)")
        }
    }
    
}
