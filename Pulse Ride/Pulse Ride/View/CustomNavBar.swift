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
                Alert(title: Text("Not Vibrating?"), message: Text(Helpers.String.alertMessage), dismissButton: .default(Text("Got it!")))
            }
            .padding(.horizontal)
            
            Spacer()
            
            Text(Helpers.String.mainTitle)
                .font(.custom("Chalkduster", size: 26))
                .fontWeight(.black)
                .foregroundColor(.white)
                .kerning(5)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .padding(.horizontal)
            
        }
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar()
    }
}
