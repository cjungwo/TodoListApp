//
//  TodoViewModel.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 21/8/2024.
//

import Foundation
import FirebaseFirestore

class TodoListViewModel: ObservableObject {
  @Published var showCreateTodoView: Bool = false
  @Published var showEditTodoView: Bool = false
  @Published var searchText: String = ""
  
  private let userId: String
  
  init(userId: String) {
    self.userId = userId
  }
  
  func deleteTodoById(_ id: String) {
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(userId)
      .collection("todos")
      .document(id)
      .delete()
  }
}
