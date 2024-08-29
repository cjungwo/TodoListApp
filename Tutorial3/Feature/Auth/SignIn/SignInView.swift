//
//  SignInView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import SwiftUI

struct SignInView: View {
  @StateObject private var viewModel = SignInViewModel()
  
  var body: some View {
    NavigationStack {
      VStack {
        //Header
        HeaderView(
          title: "To Do List",
          subtitle: "Get things done",
          angle: 15,
          backgroundColor: .indigo
        )
        
        // SignInForm
        SignInFormView(viewModel: viewModel)
        
        // Create Account
        CreateAccountView()
      }
      .navigationBarBackButtonHidden()
    }
  }
}

//MARK: - SignInFormView
private struct SignInFormView: View {
  @ObservedObject var viewModel: SignInViewModel
  
  fileprivate var body: some View {
    Form {
      
      TextField("Email Address", text: $viewModel.email)
        .textFieldStyle(DefaultTextFieldStyle())
        .textInputAutocapitalization(.never)
      
      SecureField("Password", text: $viewModel.password)
        .textFieldStyle(DefaultTextFieldStyle())
      
      VStack {
        LargeTextButton(title: "Sign In", backgroundColor: .blue, textColor: .white) {
          viewModel.signIn()
        }
        
        if !viewModel.errorMsg.isEmpty {
          Text(viewModel.errorMsg)
            .bold()
            .underline()
            .foregroundStyle(.red)
        }
      }
    }
  }
}

//MARK: - CreateAccountView
private struct CreateAccountView: View {
  fileprivate var body: some View {
    VStack {
      Text("New around here?")
      
      NavigationLink("Create an Account") {
        SignUpView()
      }
    }
    .padding(.bottom, 50)
    
    Spacer()
  }
}

#Preview {
  SignInView()
}
