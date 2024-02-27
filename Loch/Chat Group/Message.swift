//
//  Message.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

import Foundation
import FirebaseFirestore

struct Message: Codable {
    @DocumentID var id: String?
    let body: String
    let sent: Bool
    let timeStamp: Date
}
