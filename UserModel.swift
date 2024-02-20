//
//  UserModel.swift
//  Loch
//
//  Created by Phoenix Liu on 18/2/2024.
//

import Foundation
import FirebaseFirestore
import SwiftData

struct User: Codable {
    @DocumentID var email: String?
    let username: String
    let password: String
    let chatRooms: [String]
}

struct ChatRoom: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
}

@Model class UserModel {
    let email: String
    let username: String
    let password: String
    let chatRooms: [String]
    init(user: User) {
        self.email = user.email!
        self.username = user.username
        self.password = user.password
        self.chatRooms = user.chatRooms
    }
}
