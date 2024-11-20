//
//  LettersTrainerView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 16.11.2024.
//

import SwiftUI
import _SwiftData_SwiftUI

struct LettersTrainerView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    @Binding var selectedLetters: [String]
    @State private var currentLetterIndex = 0
    @State private var options: [String] = []
    @State private var correctAnswer = ""
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var score = 0
    @State private var areButtonsDisabled = false
    @State private var imageAndDescription: String?
    
    let englishTranslations = [
        "Ա": "a",
        "Բ": "b",
        "Գ": "g",
        "Դ": "d",
        "Ե": "e",
        "Զ": "z",
        "Է": "ē",
        "Ը": "ə",
        "Թ": "t‘",
        "Ժ": "ž",
        "Ի": "i",
        "Լ": "l",
        "Խ": "x",
        "Ծ": "c",
        "Կ": "k",
        "Հ": "h",
        "Ձ": "j",
        "Ղ": "ł",
        "Ճ": "č",
        "Մ": "m",
        "Յ": "y",
        "Ն": "n",
        "Շ": "š",
        "Ո": "o",
        "Չ": "č‘",
        "Պ": "p",
        "Ջ": "ǰ",
        "Ռ": "r̄",
        "Ս": "s",
        "Վ": "v",
        "Տ": "t",
        "Ր": "r",
        "Ց": "c‘",
        "Ու": "w",
        "Փ": "p‘",
        "Ք": "k‘",
        "Եվ": "ev",
        "Օ": "ô",
        "Ֆ": "f"
    ]
    
    let russianTranslations = [
        "Ա": "а",
        "Բ": "б",
        "Գ": "г",
        "Դ": "д",
        "Ե": "е",
        "Զ": "з",
        "Է": "э",
        "Ը": "ы – э",
        "Թ": "т‘",
        "Ժ": "ж",
        "Ի": "и",
        "Լ": "л",
        "Խ": "х",
        "Ծ": "тц",
        "Կ": "к",
        "Հ": "h",
        "Ձ": "дз",
        "Ղ": "гх",
        "Ճ": "тч",
        "Մ": "м",
        "Յ": "й",
        "Ն": "н",
        "Շ": "ш",
        "Ո": "во",
        "Չ": "ч",
        "Պ": "п",
        "Ջ": "дж",
        "Ռ": "р",
        "Ս": "с",
        "Վ": "в",
        "Տ": "т",
        "Ր": "р‘",
        "Ց": "ц",
        "Ու": "у",
        "Փ": "п‘",
        "Ք": "к‘",
        "Եվ": "ев",
        "Օ": "о",
        "Ֆ": "ф"
    ]
    
    let animals: [String: [String]] = [
        "Ա": ["Աստղ", "Առյուծ", "Արագիլ", "Արջ", "Ամպեր", "Աշխատանք"],
        "Բ": ["Բու", "Բադ", "Բժիշկ"],
        "Գ": ["Գայլ", "Գետ"],
        "Դ": ["Դելֆին", "Դդում", "Դանակ"],
        "Ե": ["Ելակ", "Եղնիկ", "Երկու"],
        "Զ": ["Զեբրա", "Զանգ", "Զառ"],
        "Է": ["Էշ", "էսկիմոս", "էկրա՛ն"],
        "Ը": ["Ընձուղտ", "Ընկույз", "Ընտանիք"],
        "Թ": ["Թռչուն", "Թուղթ", "Թագ"],
        "Ժ": ["Ժամացույց", "Ժողով"],
        "Ի": ["Ինքնաթիռ", "Ինը"],
        "Լ": ["Լամպ", "Լիճ", "Լեռ", "Լավաշ"],
        "Խ": ["Խոզ", "Խատուտիկ", "Խոտ"],
        "Ծ": ["Ծով", "Ծաղիկ", "Ծիծաղ", "Ծառ"],
        "Կ": ["Կատու", "Կարուսել", "Կոշիկ", "Կրակ", "Կայծակ"],
        "Հ": ["Հավ", "Հաց", "Հովանոց", "Հեքիաթ", "Հսկան"],
        "Ձ": ["Ձուկ", "Ձմեռ", "Ձայն"],
        "Ղ": ["Ղեկ", "Ղոնդոլ"],
        "Ճ": ["Ճանապարհ", "Ճանճ", "Ճամպրուկ", "Ճապոնիա"],
        "Մ": ["Մուկ", "Մեղու", "Մատիտ", "Մայրիկ", "Մորուք", "Մրջյուն"],
        "Յ": ["Յանիվ"],
        "Ն": ["Նապաստակ", "Նավ", "Նարինջ", "Նվեր"],
        "Շ": ["Շուն", "Շոկոլադ", "Շինարար"],
        "Ո": ["Ոզնի", "Ոսկե", "Ոտք", "Ոստիկանություն"],
        "Չ": ["Չար", "Չորս"],
        "Պ": ["Պատառաքաղ", "Պանիր", "Պատ", "Պատուհան"],
        "Ջ": ["Ջուր", "Ջոկեր", "Ջազ"],
        "Ռ": ["Ռադիո", "Ռետին", "Ռակետ"],
        "Ս": ["Սունկ", "Սարդ", "Սխտոր", "Սեր"],
        "Վ": ["Վարդ", "Վազ", "Վիրաբույժ"],
        "Տ": ["Տուն", "Տաքսի", "Տատիկ", "Տոմս"],
        "Ր": ["Րումբ"],
        "Ց": ["Ցուլ", "Ցանց"],
        "Ու": ["Ութոտնուկ", "Ուշադրություն", "Ուսուցիչ", "Ութ"],
        "Փ": ["Փիղ", "Փետուր", "Փաթիլ", "Փող"],
        "Ք": ["Քար", "Քանոն"],
        "Եվ": ["Եվրո", "Եվրոպա"],
        "Օ": ["Օվկիանոս", "Օդ", "Օտար"],
        "Ֆ": ["Ֆուտբոլ"]
    ]
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                if currentLetterIndex < selectedLetters.count {
                    HStack {
                        GeometryReader { geo in
                            VStack {
                                Spacer()
                                HStack {
                                    Text(selectedLetters[currentLetterIndex])
                                        .font(.system(size: 72))
                                        .bold()
                                    Text(selectedLetters[currentLetterIndex])
                                        .font(.system(size: 48))
                                        .fontWeight(.light)
                                }
                                .frame(maxWidth: geo.size.width / 2, maxHeight: geo.size.height / 4)
                                .padding()
                                Image(systemName: "volume.2")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: geo.size.width / 7, maxHeight: geo.size.height / 7)                                    .padding()
                            }
                        }
                        
                        Spacer()
                        VStack {
                            Image(imageAndDescription ?? "Արև")
                                .resizable()
                                .scaledToFit()
                            Text(imageAndDescription ?? "Արև")
                                .font(.title2)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding()
                    .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height / 4, maxHeight: geometry.size.height / 4)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Helper.ColorHex.white)
                            .shadow(color: .gray.opacity(0.4), radius: 5, x: 4, y: 4)
                    }
                    
                    Text("Выберите правильный перевод:")
                        .font(.headline)
                    
                    ForEach(options, id: \.self) { option in
                        Button {
                            checkAnswer(selected: option)
                        } label: {
                            Text(option)
                                .font(.title)
                                .bold()
                                .foregroundStyle(Helper.ColorHex.white)
                                .padding()
                                .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height / 10, alignment: .center)
                                .background(areButtonsDisabled ? Helper.ColorHex.orange.opacity(0.7) : Helper.ColorHex.orange)
                                .cornerRadius(10)
                        }
                        .disabled(areButtonsDisabled)
                        
                    }
                    
                    if showResult {
                        Text(isCorrect ? "Правильно!" : "Неправильно!")
                            .foregroundStyle(isCorrect ? .green : .red)
                            .font(.title2)
                            .padding()
                    }
                    
                    Text("Счет \(score) из \(selectedLetters.count)")
                        .font(.headline)
                        .padding()
                    
                    
                } else {
                    Spacer()
                    VStack {
                        Text("Поздравляем!")
                            .font(.title)
                        Text("Вы завершили тренировку")
                            .font(.headline)
                        Text("Итоговый счет \(score) из \(selectedLetters.count)")
                            .font(.title2)
                            .padding()
                        
                        Button {
                            playAgain()
                        } label: {
                            Text("Сыграть еще раз!")
                                .font(.headline)
                                .foregroundStyle(Helper.ColorHex.white)
                                .frame(maxWidth: geometry.size.width, maxHeight: 100)
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Helper.ColorHex.blue)
                                }
                                .padding()
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height / 3, alignment: .center)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Helper.ColorHex.white)
                            .shadow(color: .gray.opacity(0.4), radius: 5, x: 4, y: 4)
                    }
                    //                    .onAppear {
                    //                        selectedLetters = []
                    //                    }
                    Spacer()
                }
            }
            .padding()
            .onAppear(perform: setupQuestion)
            .navigationBarBackButtonHidden(currentLetterIndex >= selectedLetters.count)
        }
        .background(Helper.ColorHex.backgroundGray)
    }
    
    private func randomAnimal(_ letter: String) -> String {
        return animals[letter]?.randomElement()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "нет этой картинки\(String(describing: animals[letter]?.randomElement()))"
    }
    
    private func playAgain() {
        selectedLetters = []
        presentationMode.wrappedValue.dismiss()
    }
    
    private func setupQuestion() {
        guard currentLetterIndex < selectedLetters.count else { return }
        
        let currentLetter = selectedLetters[currentLetterIndex]
        imageAndDescription = randomAnimal(currentLetter)
        
        let multiAnswer = userData.first?.selectedLanguage
        correctAnswer = multiAnswer == "Russian" ? russianTranslations[currentLetter] ?? "ааа" : englishTranslations[currentLetter] ?? "еуые"
        
        var wrongOptions = multiAnswer == "Russian" ? Array(russianTranslations.values) : Array(englishTranslations.values)
        wrongOptions.removeAll {$0 == correctAnswer}
        wrongOptions.shuffle()
        
        options = Array(wrongOptions.prefix(3))
        options.append(correctAnswer)
        options.shuffle()
        
        showResult = false
    }
    
    private func checkAnswer(selected: String) {
        isCorrect = selected == correctAnswer
        if isCorrect {
            score += 1
        }
        
        areButtonsDisabled = true
        showResult = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            currentLetterIndex += 1
            if currentLetterIndex < selectedLetters.count {
                setupQuestion()
            }
            areButtonsDisabled = false
        }
    }
}

#Preview {
    LettersTrainerView(selectedLetters: .constant(["Ա", "Բ", "Գ"]))
}
