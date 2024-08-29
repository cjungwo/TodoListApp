//
//  ProfileView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewModel = ProfileViewModel()
  
  var body: some View {
    NavigationStack {
      VStack {
        if let user = viewModel.user {
          UserInfo(user: user)
            .padding()
          
          // Sign out
          Button("Sign out") {
            viewModel.signOut()
          }
          .tint(.red)
          .padding()
          
          Spacer()
        } else {
          Text("Loading Profile ...")
        }
      }
      .navigationTitle("Profile")
    }
    .onAppear {
      viewModel.fetchUser()
    }
  }
}

//MARK: - UserInfo
private struct UserInfo: View {
  let user: User
  
  fileprivate var body: some View {
    // Avatar
    Image(systemName: "person.circle")
      .resizable()
      .scaledToFit()
      .frame(width: 125, height: 125)
      .foregroundStyle(.blue)
    
    // Info
    VStack(alignment: .leading) {
      HStack {
        Text("Name: ")
        Text(user.fullName)
      }
      
      HStack {
        Text("Email: ")
        Text(user.email)
      }
      
      HStack {
        Text("Member Since: ")
        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
      }
    }
  }
}

#Preview {
  ProfileView()
}
