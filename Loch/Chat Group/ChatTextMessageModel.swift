//
//  File.swift
//  Loch
//
//  Created by Mark on 27/2/2024.
//

import Foundation
import SwiftData

@Model class ChatTextMessage {
    var sender: UUID
    var messageContents: String
    
    init(sender: Int, messageContents: String) {
        self.sender = sender
        self.messageContents = messageContents
    }
}
