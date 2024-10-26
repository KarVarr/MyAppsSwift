//
//  ProfileView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct Pet: Identifiable {
    var id: String
    var species: String
    var name: String
    var age: Int
    var gender: String
    var breed: String
    var allergy: String
}

struct ProfileView: View {
    @State var pet = [
        Pet(id: "1", species: "Cat", name: "Mia", age: 10, gender: "Female", breed: "Siamese", allergy: "None")
    ]
    
    
    var body: some View {
        Image("cat2")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
        
        List(pet) { pet in
            Text("Name: \(pet.name)")
            Text("Age: \(pet.age)")
            Text("Gender: \(pet.gender)")
            Text("Breed: \(pet.breed)")
            Text("Allergy: \(pet.allergy)")
        }
        .listStyle(.plain)
    }
}

#Preview {
    ProfileView()
}
