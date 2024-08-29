//
//  HeaderView.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import SwiftUI

struct HeaderView: View {
  let title: String
  let subtitle: String
  let angle: Double
  let backgroundColor: Color
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 0)
        .foregroundStyle(backgroundColor)
        .rotationEffect(Angle(degrees: angle))
      
      VStack {
        Text(title)
          .font(.system(size: 50))
          .foregroundStyle(.white)
          .bold()
        
        Text(subtitle)
          .font(.system(size: 30))
          .foregroundStyle(.white)
      }
      .padding(.top, 80)
    }
    .frame(width: UIScreen.main.bounds.width * 3, height: 350)
    .offset(y: -100)
  }
}

#Preview {
  HeaderView(title: "Test", subtitle: "Testing...", angle: 15, backgroundColor: .pink)
}
