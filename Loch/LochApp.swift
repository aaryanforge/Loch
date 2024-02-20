//
//  LochApp.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct LochApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        LoginView()
              .modelContainer(for: UserModel.self)
      }
    }
  }
}
