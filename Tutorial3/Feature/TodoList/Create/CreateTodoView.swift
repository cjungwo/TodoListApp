//
//  CreateTodoView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 22/8/2024.
//

import SwiftUI

struct CreateTodoView: View {
  @StateObject var viewModel = CreateTodoViewModel()
  @Binding var showCreateTodoView: Bool
  
  var body: some View {
    VStack {
      Text("Create New Todo")
        .font(.system(size: 32))
        .bold()
        .padding(.top, 100)
      
      Form {
        //Title
        TextField("Title", text: $viewModel.title)
          .textFieldStyle(DefaultTextFieldStyle())
        
        DatePicker("Due Date", selection: $viewModel.dueDate)
          .datePickerStyle(GraphicalDatePickerStyle())
        
        // Button
        LargeTextButton(title: "Create", backgroundColor: .blue, textColor: .white) {
          if viewModel.canSave {
            viewModel.save()
            showCreateTodoView = false
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
  CreateTodoView(showCreateTodoView: .constant(true))
}
