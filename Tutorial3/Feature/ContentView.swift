//
//  ContentView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var viewModel = ContentViewModel()
  
  var body: some View {
    if viewModel.isSignIn,
       !viewModel.currentUserId.isEmpty {
      MainTabView(userId: viewModel.currentUserId)
    } else {
      SignInView()
    }
  }
}

#Preview {
  ContentView()
}
