//
//  TodoListView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 21/8/2024.
//

import FirebaseFirestore
import SwiftUI

struct TodoListView: View {
  
  @StateObject var viewModel: TodoListViewModel
  
  @FirestoreQuery var todos: [Todo]
  
  @State var todo: Todo?
  
  init(userId: String) {
    // Path: users/<id>/todos/<entries>
    self._todos = FirestoreQuery(
      collectionPath: "users/\(userId)/todos"
    )
    
    self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
  }
  
  var filteredTodos: [Todo] {
    if viewModel.searchText.isEmpty {
      return todos
    } else {
      return todos.filter { $0.title.localizedCaseInsensitiveContains(viewModel.searchText) }
    }
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        if !todos.isEmpty {
          List(filteredTodos) { todo in
            TodoView(todo: todo)
              .swipeActions(edge: .trailing) {
                Button("Delete") {
                  viewModel.deleteTodoById(todo.id)
                }
                .tint(.red)
              }
              .swipeActions(edge: .leading) {
                Button("Edit") {
                  self.todo = todo
                  viewModel.showEditTodoView = true
                }
                .tint(.green)
              }
          }
          .listStyle(PlainListStyle())
          .searchable(text: $viewModel.searchText)
        } else {
          TodoListEmptyView(viewModel: viewModel)
        }
      }
      .navigationTitle("To-Do List")
      .toolbar {
        Button {
          viewModel.showCreateTodoView = true
        } label: {
          Image(systemName: "plus")
        }
      }
      .sheet(isPresented: $viewModel.showCreateTodoView) {
        CreateTodoView(showCreateTodoView: $viewModel.showCreateTodoView)
      }
      .sheet(isPresented: $viewModel.showEditTodoView) {
        EditTodoView(showEditTodoView: $viewModel.showEditTodoView, todo: todo!)
      }
    }
  }
}

//MARK: - TodoListEmptyView
private struct TodoListEmptyView: View {
  @ObservedObject var viewModel: TodoListViewModel
  
  fileprivate var body: some View {
    VStack(spacing: Spacing.spacing16) {
      HStack(spacing: Spacing.spacing8) {
        Image(systemName: "pencil")
          .imageScale(.large)
        
        Text("Let's manage your task!!")
          .font(.title3)
          .bold()
      }
      
      Button("Create First Todo") {
        viewModel.showCreateTodoView = true
      }
      .tint(.blue)
      
      Spacer()
    }
    .padding(.top, 50)
  }
}

#Preview {
  TodoListView(userId: "vhjU805x0YeNkceRLt4NxFyanUx2")
}
