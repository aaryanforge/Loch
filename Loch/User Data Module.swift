//
//  User Data Module.swift
//  Loch
//
//  Created by A P on 1/2/2024.
//

// HOLDS ALL USER DATA FOR IDENTIFICATION OF LOCAL APP

import Foundation

struct userData: Identifiable {
    let id = UUID()
    let name: String
}

let localUserData = [userData(name: "Aaryan"), userData(name: "Shangkuan"), userData(name: "Peng"), userData(name: "Mark")]

