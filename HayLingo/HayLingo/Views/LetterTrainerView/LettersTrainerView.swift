//
//  LettersTrainerView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 16.11.2024.
//

import SwiftUI
import SwiftData
import AVFoundation

struct LettersTrainerView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    @Binding var selectedLetters: [String]
    //    @StateObject private var viewModel: LettersTrainerViewModel
    @StateObject private var viewModel = LettersTrainerViewModel(userData: [UserData]())
    init(selectedLetters: Binding<[String]>) {
        self._selectedLetters = selectedLetters
        
    }
    
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
    
    
    //    var body: some View {
    //        GeometryReader { geometry in
    //            VStack(spacing: 20) {
    //                if viewModel.currentLetterIndex < viewModel.selectedLetters.count {
    //                    ProgressView(value: Float(viewModel.score), total: Float(viewModel.selectedLetters.count)) {
    //                    } currentValueLabel: {
    //                        Text("Верных ответов: \(viewModel.score) из \(viewModel.selectedLetters.count)")
    //                    }
    //                    .tint(Helper.ColorHex.orange)
    //                    CustomProgressView(viewModel: viewModel)
    //
    //                    HStack {
    //                        GeometryReader { geo in
    //                            VStack {
    //                                Spacer()
    //                                HStack {
    //                                    Text(viewModel.selectedLetters[viewModel.currentLetterIndex])
    //                                        .font(.system(size: 72))
    //                                        .bold()
    //                                    Text(viewModel.selectedLetters[viewModel.currentLetterIndex])
    //                                        .font(.system(size: 48))
    //                                        .fontWeight(.light)
    //                                }
    //                                .frame(maxWidth: geo.size.width , maxHeight: geo.size.height / 4)
    //                                .padding()
    //                                Button {
    //                                    print("press")
    //                                    viewModel.playSound(named: viewModel.selectedLetters[viewModel.currentLetterIndex])
    //                                    playSound(named: selectedLetters[currentLetterIndex])
    //                                    print("\(selectedLetters[currentLetterIndex])")
    //                                    print("after")
    //                                } label: {
    //                                    Image(systemName: "volume.2")
    //                                        .resizable()
    //                                        .scaledToFit()
    //                                        .foregroundStyle(.secondary)
    //                                        .frame(maxWidth: geo.size.width / 7, maxHeight: geo.size.height / 7)   .padding()
    //                                }
    //                            }
    //                        }
    //
    //                        Spacer()
    //                        VStack {
    //                            Image(viewModel.imageAndDescription ?? "Արև")
    //                                .resizable()
    //                                .scaledToFit()
    //                            Text(viewModel.imageAndDescription ?? "Արև")
    //                                .font(.title2)
    //                                .foregroundStyle(.secondary)
    //                        }
    //                    }
    //                    .padding()
    //                    .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height / 4, maxHeight: geometry.size.height / 4)
    //                    .background {
    //                        RoundedRectangle(cornerRadius: 20, style: .continuous)
    //                            .fill(Helper.ColorHex.white)
    //                            .shadow(color: .gray.opacity(0.4), radius: 5, x: 4, y: 4)
    //                    }
    //
    //                    Text("Выберите правильный перевод:")
    //                        .font(.headline)
    //
    //                    ForEach(viewModel.options, id: \.self) { option in
    //                        Button {
    //                            withAnimation(.easeInOut(duration: 0.3)) {
    //                                viewModel.selectedAnswer = option
    //                                viewModel.checkAnswer(selected: option)
    //                            }
    //                        } label: {
    //                            Text(option)
    //                                .font(.title)
    //                                .bold()
    //                                .foregroundStyle(Helper.ColorHex.white)
    //                                .padding()
    //                                .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height / 10, alignment: .center)
    //
    //                                .background(
    //                                    Group {
    //                                        if viewModel.selectedAnswer == option && viewModel.showResult {
    //                                            viewModel.isCorrect ? Color.green : Color.red
    //                                        } else {
    //                                            viewModel.areButtonsDisabled ? Helper.ColorHex.orange.opacity(0.5) : Helper.ColorHex.orange
    //                                        }
    //                                    }
    //                                )
    //                                .animation(.easeInOut(duration: 0.3), value: viewModel.selectedAnswer)
    //                                .animation(.easeInOut(duration: 0.3), value: viewModel.showResult)
    //                                .animation(.easeInOut(duration: 0.3), value: viewModel.areButtonsDisabled)
    //                                .cornerRadius(10)
    //                        }
    //                        .disabled(viewModel.areButtonsDisabled)
    //                    }
    //                } else {
    //                    Spacer()
    //                    VStack {
    //
    //                        Text(viewModel.score == viewModel.selectedLetters.count ? "Отлично!" : "Эти буквы нужно повторить:")                            .font(.title)
    //                        ScrollView(.horizontal, showsIndicators: false) {
    //                            Text("\(viewModel.wrongAnswers.joined(separator: ", "))")
    //                                .font(.title)
    //                        }
    //                        .padding()
    //
    //                        Text("Правильных ответов \(viewModel.score) из \(viewModel.selectedLetters.count)")
    //                            .font(.title2)
    //                            .padding()
    //                        Text(viewModel.score == viewModel.selectedLetters.count ? "Вы знайте все выбранные буквы!" : "У Вас все получиться!")
    //                            .font(.headline)
    //
    //                        Button {
    //                            viewModel.playAgain()
    //                        } label: {
    //                            Text("Сыграть еще раз!")
    //                                .font(.headline)
    //                                .foregroundStyle(Helper.ColorHex.white)
    //                                .frame(maxWidth: geometry.size.width, maxHeight: 100)
    //                                .background {
    //                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
    //                                        .fill(Helper.ColorHex.blue)
    //                                }
    //                                .padding()
    //                        }
    //
    //                    }
    //                    .padding()
    //                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height / 2, alignment: .center)
    //                    .background {
    //                        RoundedRectangle(cornerRadius: 20, style: .continuous)
    //                            .fill(Helper.ColorHex.white)
    //                            .shadow(color: .gray.opacity(0.4), radius: 5, x: 4, y: 4)
    //                    }
    //                    Spacer()
    //                }
    //            }
    //            .padding()
    //            .onAppear(perform: viewModel.setupQuestion)
    //            .navigationBarBackButtonHidden(viewModel.currentLetterIndex >= viewModel.selectedLetters.count)
    //        }
    //        .background(Helper.ColorHex.backgroundGray)
    //    }
    //
    //    private func playSound(named soundName: String) {
    //        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
    //            print("Sound file \(soundName).mp3 not found")
    //            return
    //        }
    //
    //        do {
    //            audioPlayer = try AVAudioPlayer(contentsOf: url)
    //            audioPlayer?.play()
    //        } catch {
    //            print("Error playing sound: \(error.localizedDescription)")
    //        }
    //    }
    //
    //    private func randomAnimal(_ letter: String) -> String {
    //        return animals[letter]?.randomElement()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "нет этой картинки\(String(describing: animals[letter]?.randomElement()))"
    //    }
    //
    //    private func playAgain() {
    //        selectedLetters = []
    //        presentationMode.wrappedValue.dismiss()
    //    }
    //
    //    private func setupQuestion() {
    //        guard currentLetterIndex < selectedLetters.count else { return }
    //
    //        selectedAnswer = nil
    //        let currentLetter = selectedLetters[currentLetterIndex]
    //        imageAndDescription = randomAnimal(currentLetter)
    //
    //        let multiAnswer = userData.first?.selectedLanguage
    //        correctAnswer = multiAnswer == "Russian" ? russianTranslations[currentLetter] ?? "" : englishTranslations[currentLetter] ?? ""
    //
    //        var wrongOptions = multiAnswer == "Russian" ? Array(russianTranslations.values) : Array(englishTranslations.values)
    //        wrongOptions.removeAll {$0 == correctAnswer}
    //        wrongOptions.shuffle()
    //
    //        options = Array(wrongOptions.prefix(3))
    //        options.append(correctAnswer)
    //        options.shuffle()
    //
    //        showResult = false
    //    }
    //
    //    private func checkAnswer(selected: String) {
    //        isCorrect = selected == correctAnswer
    //        if isCorrect {
    //            score += 1
    //            UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
    //        } else {
    //            wrongAnswers.append(selectedLetters[currentLetterIndex])
    //            UINotificationFeedbackGenerator().notificationOccurred(.error)
    //        }
    //
    //        withAnimation(.easeInOut(duration: 0.3)) {
    //            areButtonsDisabled = true
    //            showResult = true
    //        }
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
    //            withAnimation(.easeInOut(duration: 0.3)) {
    //                currentLetterIndex += 1
    //                if currentLetterIndex < selectedLetters.count {
    //                    setupQuestion()
    //                }
    //                areButtonsDisabled = false
    //            }
    //        }
    //    }
    //
    //}
    //
    //#Preview {
    //    LettersTrainerView(selectedLetters: .constant(["Ու","Ե", "Ու", "Գ"]))
    ////    LettersTrainerView()
    //}
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                if viewModel.currentLetterIndex < viewModel.selectedLetters.count {
                    CustomProgressView(viewModel: viewModel)
                    letterAndImageSection(viewModel: viewModel, geometry: geometry)
                    Text("Выберите правильный перевод:")
                        .font(.headline)
                    AnswerButtons(viewModel: viewModel, geometry: geometry)
                } else {
                    ResultSection(viewModel: viewModel, geometry: geometry)
                }
            }
            .padding()
            .background(Helper.ColorHex.backgroundGray)
            .onAppear {
                if let firstUserData = userData.first {
                    // Обновляем только свойства viewModel, не создавая новый экземпляр
                    viewModel.updateLanguage(firstUserData.selectedLanguage)
                    viewModel.setup(with: selectedLetters)
                }
            }
            .navigationBarBackButtonHidden(viewModel.currentLetterIndex >= viewModel.selectedLetters.count)
        }
    }
    
}
#Preview {
    LettersTrainerView(selectedLetters: .constant(["Ու","Ե", "Ու", "Գ"]))
    //    LettersTrainerView()
}
