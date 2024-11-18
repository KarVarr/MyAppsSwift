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
    @State private var imageAndDescription = ""
    
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
        "Ի": ["Ինքնաթիռ - самолет", "Ինը - девять"],
        "Լ": ["Լամպ - лампа", "Լիճ - озеро", "Լեռ - гора", "Լավաշ - лаваш"],
        "Խ": ["Խոզ - свинья", "Խատուտիկ - одуванчик", "Խոտ - трава"],
        "Ծ": ["Ծով - море", "Ծաղիկ - цветок", "Ծիծաղ - смех", "Ծառ - дерево"],
        "Կ": ["Կատու - кот", "Կարուսել - карусель", "Կոշիկ - обувь", "Կրակ - огонь", "Կայծակ - молния"],
        "Հ": ["Հավ - курица", "Հաց - хлеб", "Հովանոց - зонт", "Հեքիաթ - сказка", "Հսկան - гигант"],
        "Ձ": ["Ձուկ - рыба", "Ձմեռ - зима", "Ձայն - звуки"],
        "Ղ": ["Ղեկ - руль", "Ղոնդոլ - гондола"],
        "Ճ": ["Ճանապարհ - дорога", "Ճանճ - муха", "Ճամպրուկ - чемодан", "Ճապոնիա - япония"],
        "Մ": ["Մուկ - мышь", "Մեղու - пчела", "Մատիտ - карандаш", "Մայրիկ - мама", "Մորուք - борода"],
        "Յ": ["Յանիվ - йога"],
        "Ն": ["Նապաստակ - заяц", "Նավ - корабль", "Նարինջ - апельсин", "Նվեր - подарок"],
        "Շ": ["Շուն - собака", "Շոկոլադ - шоколад", "Շինարար - строитель"],
        "Ո": ["Ոզնի - еж", "Ոսկե - золото", "Ոտք - ноги", "Ոստիկանություն - полиция"],
        "Չ": ["Չար - злой", "Չորս - четыре"],
        "Պ": ["Պատառաքաղ - вилка", "Պանիր - сыр", "Պատ - стена", "Պատուհան - окно"],
        "Ջ": ["Ջուր - вода", "Ջոկեր - джокер", "Ջիեր - гиря", "Ջազ - джаз"],
        "Ռ": ["Ռադիո - радио", "Ռետին - ластик", "Ռակետ - ракета"],
        "Ս": ["Սունկ - гриб", "Սարդ - паук", "Սխտոր - чеснок", "Սեր - любовь"],
        "Վ": ["Վարդ - роза", "Վազ - ваза", "Վիզ - шея", "Վիրաբույժ - хирург"],
        "Տ": ["Տուն - дом", "Տաքսի - такси", "Տատիկ - бабушка", "Տոմս - билет"],
        "Ր": ["Րումբ - бомба"],
        "Ց": ["Ցուլ - бык", "Ցանց - сеть"],
        "Ու": ["Ութոտնուկ - осьминог", "Ուշադրություն - внимание", "Ուսուցիչ - учитель", "Ութ - восемь"],
        "Փ": ["Փիղ - слон", "Փետուր - перо", "Փաթիլ - снежинка", "Փող - деньги"],
        "Ք": ["Քար - камень", "Քանոն - линейка"],
        "Եվ": ["Եվրո - евро", "Եվրոպա - Европа"],
        "Օ": ["Օվկիանոս - океан", "Օդ - воздух", "Օտար - чужой"],
        "Ֆ": ["Ֆուտբոլ - футбол", "Ֆանտан - фонтан"]
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
                            Image(imageAndDescription)
                                .resizable()
                                .scaledToFit()
                            Text(imageAndDescription)
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
        return animals[letter]?.randomElement() ?? ""
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
        correctAnswer = multiAnswer == "Russian" ? russianTranslations[currentLetter] ?? "" : englishTranslations[currentLetter] ?? ""
        
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
