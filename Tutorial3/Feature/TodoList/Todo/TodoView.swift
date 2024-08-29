//
//  TodoView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 21/8/2024.
//

import SwiftUI

struct TodoView: View {

  @StateObject var viewModel = TodoViewModel()
  
  let todo: Todo
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(todo.title)
          .font(.body)
          .fontWeight(.bold)
        
        Text("\(Date(timeIntervalSince1970: todo.dueDate).formatted(date: .abbreviated, time: .shortened))")
          .font(.footnote)
          .foregroundStyle(Color(.secondaryLabel))
      }
      
      Spacer()
      
      Button {
        viewModel.toggleIsDone(todo: todo)
      } label: {
        Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
          .imageScale(.large)
          .foregroundStyle(.blue)
      }
      
    }
    .padding(.horizontal, Padding.horizontalPadding)
  }
}

#Preview {
  Group {
    VStack {
      TodoView(todo: Todo(title: "Todo", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970))
        .padding(.bottom)
      
      TodoView(todo: Todo(title: "Todo", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
  }
}
