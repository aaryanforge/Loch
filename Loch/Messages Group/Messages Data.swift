//
//  Messages Data.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

import Foundation
import SwiftUI

struct messagesData: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

let msgs = [
    messagesData(name: "Pala", imageName: "Connecting Image"),
    messagesData(name: "Penghus", imageName: "Connecting Image"),
    messagesData(name: "Shangkuan", imageName: "Connecting Image"),
    messagesData(name: "Madau", imageName: "Connecting Image"),
]

