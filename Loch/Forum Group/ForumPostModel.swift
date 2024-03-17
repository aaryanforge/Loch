//
//  ForumPostModel.swift
//  Loch
//
//  Created by Mark on 10/3/2024.
//

import Foundation
import SwiftData

@Model class ForumPost {
    
    var senderID: String
    var forumID: String
    
    var senderName: String
    
    var messageContents: String
    var tags: String // TODO: change later to a list of users
    var timeStamp: Date
    var comments: [ForumPostComment]
    
    init(senderID: String, messageContents: String) {
        self.senderID = senderID // foreign key -> can use this to get name of UserModel
        self.forumID = UUID().uuidString // TODO: change later
        self.messageContents = messageContents
        self.timeStamp = Date.now
        self.comments = []
        self.tags = ""
        self.senderName = ""
    }
}
