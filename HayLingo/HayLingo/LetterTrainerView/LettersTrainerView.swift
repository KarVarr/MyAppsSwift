//
//  LettersTrainerView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 16.11.2024.
//

import SwiftUI

struct LettersTrainerView: View {
    @Binding var selectedLetters: [String]
    @State private var currentLetterIndex = 0
    @State private var options: [String] = []
    @State private var correctAnswer = ""
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var score = 0
    
    let translations = [
        "Ա": "А",
        "Բ": "Б",
        "Գ": "Г",
        
    ]
    
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

    
    var body: some View {
        VStack(spacing: 20) {
            if currentLetterIndex < selectedLetters.count {
                HStack {
                    Text(selectedLetters[currentLetterIndex])
                        .font(.system(size: 72))
                        .bold()
                    Text(selectedLetters[currentLetterIndex])
                        .font(.system(size: 48))
                        .fontWeight(.light)
                }
                Text("Выберите правильный перевод:")
                    .font(.headline)
                
                ForEach(options, id: \.self) { option in
                    Button {
                        checkAnswer(selected: option)
                    } label: {
                        Text(option)
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                
                if showResult {
                    Text(isCorrect ? "Правильно!" : "Неправильно!")
                        .foregroundStyle(isCorrect ? .green : .red)
                        .font(.title2)
                        .padding()
                }
                
                Text("Счет \(score) из \(currentLetterIndex)")
                    .font(.headline)
                    .padding()
                
                
            } else {
                VStack {
                    Text("Поздравляем!")
                        .font(.title)
                    Text("Вы завершили тренировку")
                        .font(.headline)
                    Text("Итоговый счет \(score) из \(selectedLetters.count)")
                        .font(.title2)
                        .padding()
                }
            }
        }
        .padding()
        .onAppear(perform: setupQuestion)
        .navigationTitle("Тренажер букв")
    }
    
    
    private func setupQuestion() {
        guard currentLetterIndex < selectedLetters.count else { return }
        let currentLetter = selectedLetters[currentLetterIndex]
        correctAnswer = russianTranslations[currentLetter] ?? ""
        
        var wrongOptions = Array(russianTranslations.values)
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
        
        showResult = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            currentLetterIndex += 1
            if currentLetterIndex < selectedLetters.count {
                setupQuestion()
            }
        }
    }
}

#Preview {
    LettersTrainerView(selectedLetters: .constant(["Ա", "Բ", "Գ"]))
}
