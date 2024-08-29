//
//  TodoViewModel.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoViewModel: ObservableObject {
  init() {}
  
  func toggleIsDone(todo: Todo) {
    var todoCopy = todo
    todoCopy.setDone(!todo.isDone)
    
    guard let uid = Auth.auth().currentUser?.uid else {
      return
    }
        
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(uid)
      .collection("todos")
      .document(todoCopy.id)
      .setData(todoCopy.asDictionary())
    
  }
}
