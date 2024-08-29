//
//  Todo.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 21/8/2024.
//

import Foundation

struct Todo: Codable, Identifiable {
  var id: String = UUID().uuidString
  let title: String
  let dueDate: TimeInterval
  let createdDate: TimeInterval
  var isDone: Bool
  
  init(
    title: String,
    dueDate: TimeInterval,
    createdDate: TimeInterval,
    isDone: Bool = false
  ) {
    self.title = title
    self.dueDate = dueDate
    self.createdDate = createdDate
    self.isDone = isDone
  }
  
  mutating func setDone(_ state: Bool) {
    isDone = state
  }
  
}
