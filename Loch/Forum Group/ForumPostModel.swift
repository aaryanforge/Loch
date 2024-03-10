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
    var timeStamp: Date
    var comments: [ForumPostComment]
    
    init(senderID: String, senderName: String, messageContents: String) {
        self.senderID = senderID
        self.senderName = senderName
        self.forumID = UUID().uuidString // TODO: change later
        self.messageContents = messageContents
        self.timeStamp = Date.now
        self.comments = []
    }
}
