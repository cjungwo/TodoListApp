//
//  AuthViewModel.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignInViewModel: ObservableObject {
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var errorMsg: String = ""
  
  
  init() {}
  
  func signIn() {
    guard validateSignIn() else {
      return
    }
    
    Auth.auth().signIn(withEmail: email, password: password)
  }
  
  private func validateSignIn() -> Bool {
    errorMsg = ""
      
    guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
          !password.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMsg = "Please fill in all fields"
      return false
    }
    
    guard email.contains("@") && email.contains(".") else {
      errorMsg = "Please enter valid email"
      return false
    }
    
    return true
  }
}
