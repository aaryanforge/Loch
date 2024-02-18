//
//  Message.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

import Foundation

struct Message: Identifiable, Codable {
    let id: String
    let body: String
    let sent: Bool
    let timeStamp: Date
}
