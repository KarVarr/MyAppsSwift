//
//  ProfileView.swift
//  PetSnund
//
//  Created by Karen Vardanian on 25.10.2024.
//

import SwiftUI

struct Pet: Identifiable {
    var id: String?
    var species: String?
    var name: String?
    var age: Int?
    var gender: String?
    var breed: String?
    var allergy: String?
}

struct ProfileView: View {
    @State var pet = [
        Pet(id: "1", species: "Cat", name: "Mia", age: 10, gender: "Female", breed: "Siamese", allergy: "None")
    ]
    @State private var petName = ""
    @State private var selectedAge: String = "5"
    @State private var selectedGender = "Male"
    @State private var selectedSpecies = "Cat"
    @State private var isOnAllergy = false
    
    let petGender = ["Male", "Female"]
    let pets = ["Dog", "Cat", "Hamster", "Rabbit", "Fish", "Bird", "Guinea Pig", "Ferret", "Turtle", "Snake", "Lizard", "Frog", "Parrot", "Mouse", "Rat", "Horse", "Pig", "Goat", "Chicken", "Duck"]

    var body: some View {
        VStack {
            Image("cat2")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            List(pet) { pet in
                HStack{
                    Picker("Species", selection: $selectedSpecies) {
                        ForEach(pets, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                HStack{
                    Text("Name:")
                    TextField("Enter pet name", text: $petName)
                }
                HStack{
                    Text("Age:")
                    TextField("Enter pet age", text: $selectedAge)
                        .keyboardType(.numberPad)
                }
                HStack{
                    Text("Gender:")
                    Picker("Gender", selection: $selectedGender) {
                        ForEach(petGender, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                HStack{
                    Text("Breed:")
                    TextField("Enter pet breed", text: $petName)
                }
                HStack{
                    Toggle("Allergy", isOn: $isOnAllergy)
                        .toggleStyle(.switch)
                }
            }
        }
        .listStyle(.plain)
    }
}


#Preview {
    ProfileView()
}
