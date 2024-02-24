//
//  MessageRoomsManager.swift
//  Loch
//
//  Created by Phoenix Liu on 19/2/2024.
//

import Foundation
import FirebaseFirestore
import SwiftData
import SwiftUI

//enum chatRoomErrors: Error {
//    case chatRoomUnfound
//}

class MessageRoomsManager: ObservableObject {
    
    @Published private(set) var chatRooms: [ChatRoom] = []
    let db = Firestore.firestore()
    let loggedInUser: UserModel
    
    init(user: UserModel) {
        self.loggedInUser = user
    }
    
    func getMessageRooms() -> [ChatRoom] {
        for roomId in self.loggedInUser.chatRooms {
            //print(roomId)
//            if let roomId = roomId {
            print(roomId)
            db.collection("chatRoom").document(roomId).addSnapshotListener({ chatRoom, error in
                guard error != nil else {
                    print("Error in fetching chat room")
                    return
                }
                                         
                if let chatRoom = chatRoom {
                    do {
                        try self.chatRooms.append(chatRoom.data(as: ChatRoom.self))
                    } catch {
                        print("Chat Room could not be cast")
                    }
                }
            })
                
            //}
        }
        return self.chatRooms
        //do {
//            db.collection("chatRoom").addSnapshotListener { chatRoom, error in
//                if let chatRoom = chatRoom {
//                    if chatRoom.exists {
//                        
//                    } else {
//                        print ("ERR: Chat room does not exist")
//                    }
//                }
//            }
//        user = db.collection("users").
//        let chatRooms = db.collection("chatRoom").
        //}
        
    }
}
