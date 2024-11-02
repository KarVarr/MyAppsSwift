//
//  CollectionViewHorizontal.swift
//  PetSnund
//
//  Created by Karen Vardanian on 02.11.2024.
//

import SwiftUI
import SwiftUIPager

struct CollectionViewHorizontal: View {
    @StateObject var page: Page = .first()
    var items = Array(0..<20)
    
    var body: some View {
        Pager(page: page, data: items, id: \.self) { index in
            Text("Page: \(index)"
            )
        }
        .sensitivity(.high)
//        .vertical()
    }
}

#Preview {
    CollectionViewHorizontal()
}

//struct SnapCarousel<Content: View>: View {
//    let items: Int
//    let spacing: CGFloat
//    let trailingSpace: CGFloat
//    @Binding var index: Int
//    let content: (Int) -> Content
//
//    init(items: Int,
//         spacing: CGFloat = 15,
//         trailingSpace: CGFloat = 100,
//         index: Binding<Int>,
//         @ViewBuilder content: @escaping (Int) -> Content) {
//
//        self.items = items
//        self.spacing = spacing
//        self.trailingSpace = trailingSpace
//        self._index = index
//        self.content = content
//    }
//
//    @GestureState private var offset: CGFloat = 0
//    @State private var currentIndex: Int = 0
//
//    var body: some View {
//        GeometryReader { geometry in
//            let width = geometry.size.width - (trailingSpace - spacing)
//
//            HStack(spacing: spacing) {
//                ForEach(0..<items, id: \.self) { item in
//                    content(item)
//                        .frame(width: geometry.size.width - trailingSpace)
//                }
//            }
//            .padding(.horizontal, spacing)
//            .offset(x: (CGFloat(currentIndex) * -width) + offset)
//            .gesture(
//                DragGesture()
//                    .updating($offset) { value, out, _ in
//                        out = value.translation.width
//                    }
//                    .onEnded { value in
//                        let offsetX = value.translation.width
//                        let progress = -offsetX / width
//                        let roundIndex = progress.rounded()
//
//                        currentIndex = max(min(currentIndex + Int(roundIndex), items - 1), 0)
//                        index = currentIndex
//                    }
//            )
//            .animation(.easeInOut, value: offset == 0)
//        }
//    }
//}
//
//struct CollectionViewHorizontal: View {
//    @State private var currentIndex: Int = 0
//
//    var body: some View {
//        SnapCarousel(items: 20, index: $currentIndex) { index in
//            Rectangle()
//                .fill(.blue)
//                .cornerRadius(10)
//        }
//        .frame(height: 300)
//    }
//}
//
//#Preview {
//    CollectionViewHorizontal()
//}
