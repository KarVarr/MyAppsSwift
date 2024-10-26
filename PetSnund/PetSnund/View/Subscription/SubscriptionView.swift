//
//  SubscriptionView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct SubscriptionView: View {
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text("Your subscription is")
                    Text("active")
                        .foregroundStyle(.green)
                }
                Image(systemName: "dog.fill")
            }
            
            Text("Yerevan, Armenia. Manushian street, 100")
                .foregroundStyle(.gray)
            
            Spacer()
            
            
            VStack {
                HStack {
                    Image("food1")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .leading) {
                        Text("Royal Canin")
                        Text("Count: 2")
                        Text("Item number: 1241341")
                        Text("Warehouse: Yerevan")
                        Text("Delivery: Every Friday")
                    }
                    
                }
                Divider()
                Text("9 000 dram")
                    .padding()
                    .font(.title2)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding()
            .shadow(radius: 10)
            
            Spacer()
            
            VStack {
                Button("Cancel subscription") {}
                Button("Change subscription") {}
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    SubscriptionView()
}
