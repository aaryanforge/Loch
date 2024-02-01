//
//  Profile Data.swift
//  Loch
//
//  Created by A P on 1/2/2024.
//

import Foundation
import SwiftUI

struct localData: Identifiable {
    let id = UUID()
    var name: String
    var nickname: String
    var aboutMe: String
}

var profData = [localData(name: "Aaryan", nickname: "Pala", aboutMe: "")]
