//
//  EditTodoViewModel.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 27/8/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EditTodoViewModel: ObservableObject {
  @Published var title: String
  @Published var dueDate: Date
  @Published var showAlert: Bool = false
  
  let todo: Todo
  
  init(todo: Todo) {
    self.todo = todo
    self.title = todo.title
    self.dueDate = Date(timeIntervalSince1970: todo.dueDate)
  }
}

//
extension EditTodoViewModel {
  func edit() {
    guard canEdit else {
      return
    }
    
    // Get current user id
    guard let uId = Auth.auth().currentUser?.uid else {
      return
    }
    
    // Save Model
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(uId)
      .collection("todos")
      .document(todo.id)
      .setData([
        "id": todo.id,
        "title": title,
        "dueDate": dueDate.timeIntervalSince1970,
        "createdDate": todo.createdDate,
        "isDone": todo.isDone
      ])
  }
  
  var canEdit: Bool {
    guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
      return false
    }
    
    guard dueDate >= Date().addingTimeInterval(-86400) else {
      return false
    }
    
    return true
  }
}
