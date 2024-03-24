//
//  LochApp.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI
import SwiftData
import Amplify
import AWSCognitoAuthPlugin

@main
struct LochApp: App {


  var body: some Scene {
    WindowGroup {
        ContentView()
            .modelContainer(for: [ChatTextMessage.self, ForumPost.self, ForumPostComment.self])
    }
  }
    init() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Amplify auth ready")
        } catch {
            print("Amplify config failed with error \(error)")
        }
    }
 

}
