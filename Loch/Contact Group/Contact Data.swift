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
    let nickname: String
    let imageName: String
    let aboutMe: String
}

let contacts = [contactData(name: "Aaryan", nickname: "Pala", imageName: "Aaryan", aboutMe: profData[0].aboutMe),
                contactData(name: "Peng", nickname: "Penghus", imageName: "Peng", aboutMe: "I am Penghus Khan and I conquered all of asia"),
                contactData(name: "Shangkuan", nickname: "Tommy", imageName: "Thomas", aboutMe: "I'm a USYD communist"),
                contactData(name: "Madau", nickname: "Mak", imageName: "Mark", aboutMe: "Average UTS eshay"),
]

