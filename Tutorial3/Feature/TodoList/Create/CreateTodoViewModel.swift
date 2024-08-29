//
//  CreateTodoViewModel.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class CreateTodoViewModel: ObservableObject {
  @Published var title: String = ""
  @Published var dueDate: Date = .now
  @Published var showAlert: Bool = false
  
  func save() {
    guard canSave else {
      return
    }
    
    // Get current user id
    guard let uId = Auth.auth().currentUser?.uid else {
      return
    }
    
    // Create model
    let newTodo = Todo(
      title: title,
      dueDate: dueDate.timeIntervalSince1970,
      createdDate: Date().timeIntervalSince1970
    )
    
    // Save Model
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(uId)
      .collection("todos")
      .document(newTodo.id)
      .setData(newTodo.asDictionary())
  }
  
  var canSave: Bool {
    guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
      return false
    }
    
    guard dueDate >= Date().addingTimeInterval(-86400) else {
      return false
    }
    
    return true
  }
}
