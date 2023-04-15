//
//  MyButtonStyleRestart.swift
//  MindGrid
//
//  Created by Karen Vardanian on 14.04.2023.
//

import SwiftUI


struct MyButtonStyleRestart: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding()
      .frame(maxWidth: .infinity)
      .foregroundColor(configuration.isPressed ? .black : .white)
      .font(.system(size: 24,design: .monospaced))
      .fontWeight(.bold)
      .background(configuration.isPressed ? Color.pink : Color.indigo)
      .cornerRadius(8.0)
      .padding(.vertical, 10)

  }


}


