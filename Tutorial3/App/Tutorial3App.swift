//
//  Tutorial3App.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 21/8/2024.
//

import FirebaseCore
import SwiftUI

@main
struct Tutorial3App: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
