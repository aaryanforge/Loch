//
//  ForumPostCommentsModel.swift
//  Loch
//
//  Created by Mark on 10/3/2024.
//

import Foundation
import SwiftData

@Model class ForumPostComment {
    
    var senderID: String
    var commentID: String
    var parentID: String
    
    var messageContents: String
    var timeStamp: Date
    
    init(senderID: String, messageContents: String) {
        self.senderID = senderID
        self.commentID = "" // TODO: change later
        self.parentID = "" // TODO: change later
        self.messageContents = messageContents
        self.timeStamp = Date.now
    }
}
