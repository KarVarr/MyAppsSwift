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
    @StateObject private var viewModel = LettersTrainerViewModel(userData: [UserData]())
    
    init(selectedLetters: Binding<[String]>) {
        self._selectedLetters = selectedLetters
    }
    
//    let englishTranslations = [
//        "Ա": "a",
//        "Բ": "b",
//        "Գ": "g",
//        "Դ": "d",
//        "Ե": "e",
//        "Զ": "z",
//        "Է": "ē",
//        "Ը": "ə",
//        "Թ": "t‘",
//        "Ժ": "ž",
//        "Ի": "i",
//        "Լ": "l",
//        "Խ": "x",
//        "Ծ": "c",
//        "Կ": "k",
//        "Հ": "h",
//        "Ձ": "j",
//        "Ղ": "ł",
//        "Ճ": "č",
//        "Մ": "m",
//        "Յ": "y",
//        "Ն": "n",
//        "Շ": "š",
//        "Ո": "o",
//        "Չ": "č‘",
//        "Պ": "p",
//        "Ջ": "ǰ",
//        "Ռ": "r̄",
//        "Ս": "s",
//        "Վ": "v",
//        "Տ": "t",
//        "Ր": "r",
//        "Ց": "c‘",
//        "Ու": "w",
//        "Փ": "p‘",
//        "Ք": "k‘",
//        "Եվ": "ev",
//        "Օ": "ô",
//        "Ֆ": "f"
//    ]
//    
//    let russianTranslations = [
//        "Ա": "а",
//        "Բ": "б",
//        "Գ": "г",
//        "Դ": "д",
//        "Ե": "е",
//        "Զ": "з",
//        "Է": "э",
//        "Ը": "ы – э",
//        "Թ": "т‘",
//        "Ժ": "ж",
//        "Ի": "и",
//        "Լ": "л",
//        "Խ": "х",
//        "Ծ": "тц",
//        "Կ": "к",
//        "Հ": "h",
//        "Ձ": "дз",
//        "Ղ": "гх",
//        "Ճ": "тч",
//        "Մ": "м",
//        "Յ": "й",
//        "Ն": "н",
//        "Շ": "ш",
//        "Ո": "во",
//        "Չ": "ч",
//        "Պ": "п",
//        "Ջ": "дж",
//        "Ռ": "р",
//        "Ս": "с",
//        "Վ": "в",
//        "Տ": "т",
//        "Ր": "р‘",
//        "Ց": "ц",
//        "Ու": "у",
//        "Փ": "п‘",
//        "Ք": "к‘",
//        "Եվ": "ев",
//        "Օ": "о",
//        "Ֆ": "ф"
//    ]
//    
//    let animals: [String: [String]] = [
//        "Ա": ["Աստղ", "Առյուծ", "Արագիլ", "Արջ", "Ամպեր", "Աշխատանք"],
//        "Բ": ["Բու", "Բադ", "Բժիշկ"],
//        "Գ": ["Գայլ", "Գետ"],
//        "Դ": ["Դելֆին", "Դդում", "Դանակ"],
//        "Ե": ["Ելակ", "Եղնիկ", "Երկու"],
//        "Զ": ["Զեբրա", "Զանգ", "Զառ"],
//        "Է": ["Էշ", "էսկիմոս", "էկրա՛ն"],
//        "Ը": ["Ընձուղտ", "Ընկույз", "Ընտանիք"],
//        "Թ": ["Թռչուն", "Թուղթ", "Թագ"],
//        "Ժ": ["Ժամացույց", "Ժողով"],
//        "Ի": ["Ինքնաթիռ", "Ինը"],
//        "Լ": ["Լամպ", "Լիճ", "Լեռ", "Լավաշ"],
//        "Խ": ["Խոզ", "Խատուտիկ", "Խոտ"],
//        "Ծ": ["Ծով", "Ծաղիկ", "Ծիծաղ", "Ծառ"],
//        "Կ": ["Կատու", "Կարուսել", "Կոշիկ", "Կրակ", "Կայծակ"],
//        "Հ": ["Հավ", "Հաց", "Հովանոց", "Հեքիաթ", "Հսկան"],
//        "Ձ": ["Ձուկ", "Ձմեռ", "Ձայն"],
//        "Ղ": ["Ղեկ", "Ղոնդոլ"],
//        "Ճ": ["Ճանապարհ", "Ճանճ", "Ճամպրուկ", "Ճապոնիա"],
//        "Մ": ["Մուկ", "Մեղու", "Մատիտ", "Մայրիկ", "Մորուք", "Մրջյուն"],
//        "Յ": ["Յանիվ"],
//        "Ն": ["Նապաստակ", "Նավ", "Նարինջ", "Նվեր"],
//        "Շ": ["Շուն", "Շոկոլադ", "Շինարար"],
//        "Ո": ["Ոզնի", "Ոսկե", "Ոտք", "Ոստիկանություն"],
//        "Չ": ["Չար", "Չորս"],
//        "Պ": ["Պատառաքաղ", "Պանիր", "Պատ", "Պատուհան"],
//        "Ջ": ["Ջուր", "Ջոկեր", "Ջազ"],
//        "Ռ": ["Ռադիո", "Ռետին", "Ռակետ"],
//        "Ս": ["Սունկ", "Սարդ", "Սխտոր", "Սեր"],
//        "Վ": ["Վարդ", "Վազ", "Վիրաբույժ"],
//        "Տ": ["Տուն", "Տաքսի", "Տատիկ", "Տոմս"],
//        "Ր": ["Րումբ"],
//        "Ց": ["Ցուլ", "Ցանց"],
//        "Ու": ["Ութոտնուկ", "Ուշադրություն", "Ուսուցիչ", "Ութ"],
//        "Փ": ["Փիղ", "Փետուր", "Փաթիլ", "Փող"],
//        "Ք": ["Քար", "Քանոն"],
//        "Եվ": ["Եվրո", "Եվրոպա"],
//        "Օ": ["Օվկիանոս", "Օդ", "Օտար"],
//        "Ֆ": ["Ֆուտբոլ"]
//    ]
 
    
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
            .background(Helper.ColorHex.backgroundLightGray)
            .onAppear {
                if let firstUserData = userData.first {
                    viewModel.updateLanguage(firstUserData.selectedLanguage ?? "Russian")
                    viewModel.setup(with: selectedLetters)
                }
            }
            .navigationBarBackButtonHidden(viewModel.currentLetterIndex >= viewModel.selectedLetters.count)
        }
    }
    
}
#Preview {
    LettersTrainerView(selectedLetters: .constant(["Ու","Ե", "Ու", "Գ"]))
}
