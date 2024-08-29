//
//  MainTabView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import SwiftUI

struct MainTabView: View {
  var userId: String
  
  var body: some View {
    TabView {
      TodoListView(userId: userId)
        .tabItem {
          Label("Home", systemImage: "house")
        }
      
      ProfileView()
        .tabItem {
          Label("Profile", systemImage: "person")
        }
    }
  }
}

#Preview {
  MainTabView(userId: "vhjU805x0YeNkceRLt4NxFyanUx2")
}
