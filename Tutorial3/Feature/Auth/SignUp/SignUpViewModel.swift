//
//  SignUpViewModel.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignUpViewModel: ObservableObject {
  @Published var fullName: String = ""
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var errorMsg: String = ""
  
  
  init() {}
  
  func signUp() {
    guard validateSignUp() else {
      return
    }
    
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
      guard let userId = result?.user.uid else {
        return
      }
      
      self?.insertUserRecord(id: userId)
    }
  }
  
  private func insertUserRecord(id: String) {
    let newUser = User(
      id: id,
      fullName: fullName,
      email: email,
      joined: Date().timeIntervalSince1970
    )
    
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(id)
      .setData(newUser.asDictionary())
  }
  
  private func validateSignUp() -> Bool {
    errorMsg = ""
      
    guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
          !password.trimmingCharacters(in: .whitespaces).isEmpty,
          !fullName.trimmingCharacters(in: .whitespaces).isEmpty else {
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
