//
//  EditView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 27/8/2024.
//

import SwiftUI

struct EditTodoView: View {
  @StateObject var viewModel: EditTodoViewModel
  @Binding var showEditTodoView: Bool
  
  init(showEditTodoView: Binding<Bool>, todo: Todo) {
    self._showEditTodoView = showEditTodoView
    self._viewModel = StateObject(wrappedValue: EditTodoViewModel(todo: todo))
  }
  
  var body: some View {
    VStack {
      Text("Edit Todo")
        .font(.system(size: 32))
        .bold()
        .padding(.top, 100)
      
      Form {
        //Title
        TextField("\(viewModel.todo.title)", text: $viewModel.title)
          .textFieldStyle(DefaultTextFieldStyle())
        
        DatePicker("Due Date", selection: $viewModel.dueDate)
          .datePickerStyle(GraphicalDatePickerStyle())
        
        // Button
        LargeTextButton(title: "Edit", backgroundColor: .blue, textColor: .white) {
          if viewModel.canEdit {
            viewModel.edit()
            showEditTodoView = false
          } else {
            viewModel.showAlert = true
          }
        }
        .padding()
      }
      .alert(isPresented: $viewModel.showAlert) {
        Alert(
          title: Text("Error"),
          message: Text("Please fill in all fields and select due date that is today or newer.")
        )
      }
    }
  }
}

#Preview {
  EditTodoView(
    showEditTodoView: .constant(true),
    todo: Todo(
      title: "Title",
      dueDate: Date().timeIntervalSince1970,
      createdDate: Date().timeIntervalSince1970
    ))
}
