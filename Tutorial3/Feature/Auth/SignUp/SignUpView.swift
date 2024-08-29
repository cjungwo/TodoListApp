//
//  SignUpView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import SwiftUI

struct SignUpView: View {
  @StateObject private var viewModel = SignUpViewModel()

  var body: some View {
    NavigationStack {
      VStack {
        // Header
        HeaderView(
          title: "Register",
          subtitle: "Start organizing todos",
          angle: -15,
          backgroundColor: .orange
        )
        
        SignUpFormView(viewModel: viewModel)
        
        LoginView()
      }
      .navigationBarBackButtonHidden()
    }
  }
}

//MARK: - SignUpFormView
private struct SignUpFormView: View {
  @ObservedObject var viewModel: SignUpViewModel
  
  fileprivate var body: some View {
    Form {
      TextField("Full Name", text: $viewModel.fullName)
        .textFieldStyle(DefaultTextFieldStyle())
      
      TextField("Email Address", text: $viewModel.email)
        .textFieldStyle(DefaultTextFieldStyle())
        .textInputAutocapitalization(.never)
    
      SecureField("Password", text: $viewModel.password)
        .textFieldStyle(DefaultTextFieldStyle())
      
      LargeTextButton(
        title: "Sign Up",
        backgroundColor: .green,
        textColor: .white
      ) {
        viewModel.signUp()
      }
    }
  }
}

//MARK: - SignInView
private struct LoginView: View {
  @Environment(\.dismiss) var dismiss
  
  fileprivate var body: some View {
    VStack {
      Text("Already had Account?")
      
      Button {
        dismiss()
      } label: {
        Text("sign in")
      }
    }
    .padding(.bottom, 50)
    
    Spacer()
  }
}


#Preview {
  SignUpView()
}
