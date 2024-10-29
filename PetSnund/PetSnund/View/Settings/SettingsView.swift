//
//  SettingsView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Settings")
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                }
                Image("cat1")
                    .resizable()
                    .frame(width:100, height:100)
                ZStack {
                    Rectangle()
                        .foregroundStyle(.indigo)
                        .frame(width: geo.size.width - 15, height: geo.size.height / 8)
                        .clipShape( RoundedRectangle(cornerRadius: 20, style: .continuous))
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Wallet")
                                .font(.title)
                            Image(systemName: "wallet.bifold.fill")
                        }
                        Text("Your Balance: 0 dram")
                            .font(.title2)
                    }
                    .foregroundStyle(.white)
                }
                ZStack {
                    Rectangle()
                        .foregroundStyle(.indigo)
                        .frame(width: geo.size.width - 15, height: geo.size.height / 12)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName:"heart.fill")
                            Text("Favotites")
                                .font(.title)
                        }
                    }
                    .foregroundStyle(.white)
                    
                }
                ZStack {
                    Rectangle()
                        .foregroundStyle(.indigo)
                        .frame(width: geo.size.width - 15, height: geo.size.height / 12)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName:"dollarsign.circle.fill")
                            Text("Purchases")
                                .font(.title)
                        }
                    }
                    .foregroundStyle(.white)
                }
            }
            .foregroundStyle(Color.black)
            .background(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    SettingsView()
}
