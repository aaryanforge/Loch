//
//  User.swift
//  Loch
//
//  Created by Phoenix Liu on 18/2/2024.
//

import Foundation
import FirebaseFirestore

struct User: Codable {
    @DocumentID var email: String?
    let username: String
    let password: String
}
