//
//  CustomNavBar.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 07.06.2023.
//

import SwiftUI

struct CustomNavBar: View {
    @StateObject private var massageVM = MassageViewModel.shared
    @State private var showingAlertNotVibration = false
    @Binding var isScreenLocked: Bool 
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                showingAlertNotVibration = true
                massageVM.impactFeedback(.light)
            } label: {
                Image(systemName: "questionmark.circle")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .alert(isPresented: $showingAlertNotVibration) {
                Alert(title: Text("Doesn't work?"), message: Text(Helpers.String.alertMessage), dismissButton: .default(Text("Got it!")))
            }
            .padding(.horizontal)
            
            Spacer()
            
            Text(Helpers.String.mainTitle)
                .font(.custom("PartyLetPlain", size: 36))
                .fontWeight(.black)
                .foregroundColor(.white)
                .kerning(5)
            
            Spacer()
            
            Button {
                withAnimation(.easeInOut) {
                    isScreenLocked.toggle()
                }
            } label: {
                Image(systemName: isScreenLocked ? "lock.open" : "lock")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .contentTransition(.symbolEffect(.replace))
            }
            .padding(.horizontal)
            .zIndex(10)
        }
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar(isScreenLocked: .constant(false))
    }
}
