//
//  LargeTextButton.swift
//  Tutorial3
//
//  Created by JungWoo Choi on 26/8/2024.
//

import SwiftUI

struct LargeTextButton: View {
  
  let title: String
  let backgroundColor: Color
  let textColor: Color
  var action: () -> Void
  
  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .foregroundStyle(backgroundColor)
        
        Text(title)
          .foregroundStyle(textColor)
          .bold()
      }
    }
  }
}

#Preview {
  LargeTextButton(title: "Title", backgroundColor: .green, textColor: .white) {
    //
  }
}
