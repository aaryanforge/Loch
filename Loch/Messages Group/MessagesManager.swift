//
//  MessagesManager.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

import Foundation
import FirebaseFirestore

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    let db = Firestore.firestore()
    
    init()  {
        Task
        {
            await getMessages()
        }
    }
    
    func getMessages() async {
        do {
            let snapshot = try await db.collection("messages").getDocuments()
            for message in snapshot.documents {
                try messages.append(message.data(as: Message.self))
            }
        } catch {
            print("ERR: \(error)")
        }
    }
    
}
