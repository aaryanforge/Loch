//
//  MessageRoomsManager.swift
//  Loch
//
//  Created by Phoenix Liu on 19/2/2024.
//

import Foundation
import FirebaseFirestore

class MessageRoomsManager: ObservableObject {
    private var db: Firestore
    
    init() {
        self.db = Firestore.firestore()
        getMessageRooms()
    }
    func getMessageRooms() {
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
