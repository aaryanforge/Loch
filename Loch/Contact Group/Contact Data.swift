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

let contacts = [contactData(name: "Pala", imageName: "Aaryan"), contactData(name: "Penghus", imageName: "Peng"), contactData(name: "Shangkuan", imageName: "Thomas"), contactData(name: "Madau", imageName: "Mark")]

