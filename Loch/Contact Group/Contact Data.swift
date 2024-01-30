//
//  Contact Data.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

import Foundation
import SwiftUI

struct contactData: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

let contacts = [contactData(name: "Pala", imageName: "Connecting Image"), contactData(name: "Penghus", imageName: "Connecting Image"), contactData(name: "Shangkuan", imageName: "Connecting Image"), contactData(name: "Madau", imageName: "Connecting Image")]

