//
//  ViewModel.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import FirebaseAuth
import Foundation

class ContentViewModel: ObservableObject {
  @Published var currentUserId: String = ""
  private var handler: AuthStateDidChangeListenerHandle?
  
  init() {
    self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
      DispatchQueue.main.async {
        self?.currentUserId = user?.uid ?? ""
      }
    }
  }
  
  public var isSignIn: Bool {
    return Auth.auth().currentUser != nil
  }
}
