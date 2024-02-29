//
//  File.swift
//  Loch
//
//  Created by Mark on 27/2/2024.
//

import Foundation
import SwiftData

@Model class ChatTextMessage {
    var senderID: String
    var messageContents: String
    
    init(senderID: String, messageContents: String) {
        self.senderID = senderID
        self.messageContents = messageContents
    }
}


