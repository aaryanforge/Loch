//
//  Messages Data.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

import Foundation
import SwiftUI

struct messagesData: Identifiable, Codable {
    let id: String
    let name: String
    let imageName: String
}

let msgs: [messagesData] = [messagesData(id: "1", name: "phonker", imageName: "Connecting Image")]

