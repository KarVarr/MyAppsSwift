//
//  Helper.swift
//  Pidget
//
//  Created by Karen Vardanian on 16.04.2024.
//

import UIKit
import SwiftUI


struct CustomLine: View {
  let color: Color
  let width: CGFloat
  let from: CGPoint
  let to: CGPoint

  var body: some View {
    Path { path in
      path.move(to: from)
      path.addLine(to: to)
    }
    .stroke(color, lineWidth: width)
  }
}



