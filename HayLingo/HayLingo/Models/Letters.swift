//
//  Letters.swift
//  HayLingo
//
//  Created by Karen Vardanian on 26.11.2024.
//

import Foundation


struct Letter: Identifiable{
    var id = UUID()
    let character: String
    let englishTranslation: String
    let russianTranslation: String
    let animals: [String]
}


extension Letter {
    
    static let allLetters: [Letter] = [
        Letter(character: "Ա", englishTranslation: "a", russianTranslation: "а", animals: ["Աստղ", "Առյուծ", "Արագիլ", "Արջ", "Ամպեր", "Աշխատանք"]),
        Letter(character: "Բ", englishTranslation: "b", russianTranslation: "б", animals: ["Բու", "Բադ", "Բժիշկ"]),
        Letter(character: "Գ", englishTranslation: "g", russianTranslation: "г", animals: ["Գայլ", "Գետ"]),
        Letter(character: "Դ", englishTranslation: "d", russianTranslation: "д", animals: ["Դելֆին", "Դդում", "Դանակ"]),
        Letter(character: "Ե", englishTranslation: "e", russianTranslation: "е", animals: ["Ելակ", "Եղնիկ", "Երկու"]),
        Letter(character: "Զ", englishTranslation: "z", russianTranslation: "з", animals: ["Զեբра", "Զանգ", "Զառ"]),
        Letter(character: "Է", englishTranslation: "ē", russianTranslation: "э", animals: ["Էշ", "էսկիմոս", "էկրա՛ն"]),
        Letter(character: "Ը", englishTranslation: "ə", russianTranslation: "ы – э", animals: ["Ընձուղտ", "Ընկույз", "Ընտանիք"]),
        Letter(character: "Թ", englishTranslation: "t‘", russianTranslation: "т‘", animals: ["Թռչուն", "Թուղթ", "Թագ"]),
        Letter(character: "Ժ", englishTranslation: "ž", russianTranslation: "ж", animals: ["Ժամացույց", "Ժողով"]),
        Letter(character: "Ի", englishTranslation: "i", russianTranslation: "и", animals: ["Ինքնաթիռ", "Ինը"]),
        Letter(character: "Լ", englishTranslation: "l", russianTranslation: "л", animals: ["Լամպ", "Լիճ", "Լեռ", "Լավաշ"]),
        Letter(character: "Խ", englishTranslation: "x", russianTranslation: "х", animals: ["Խոզ", "Խատուտիկ", "Խոտ"]),
        Letter(character: "Ծ", englishTranslation: "c", russianTranslation: "тц", animals: ["Ծով", "Ծաղիկ", "Ծիծաղ", "Ծառ"]),
        Letter(character: "Կ", englishTranslation: "k", russianTranslation: "к", animals: ["Կատու", "Կարուսել", "Կոշիկ", "Կրակ", "Կայծակ"]),
        Letter(character: "Հ", englishTranslation: "h", russianTranslation: "h", animals: ["Հավ", "Հաց", "Հովանոց", "Հեքիաթ", "Հսկան"]),
        Letter(character: "Ձ", englishTranslation: "j", russianTranslation: "дз", animals: ["Ձուկ", "Ձմեռ", "Ձայն"]),
        Letter(character: "Ղ", englishTranslation: "ł", russianTranslation: "гх", animals: ["Ղեկ", "Ղոնդոլ"]),
        Letter(character: "Ճ", englishTranslation: "č", russianTranslation: "тч", animals: ["Ճանապարհ", "Ճանճ", "Ճամպրուկ", "Ճապոնիա"]),
        Letter(character: "Մ", englishTranslation: "m", russianTranslation: "м", animals: ["Մուկ", "Մեղու", "Մատիտ", "Մայրիկ", "Մորուք", "Մրջյուն"]),
        Letter(character: "Յ", englishTranslation: "y", russianTranslation: "й", animals: ["Յանիվ"]),
        Letter(character: "Ն", englishTranslation: "n", russianTranslation: "н", animals: ["Նապաստակ", "Նավ", "Նարինջ", "Նվեր"]),
        Letter(character: "Շ", englishTranslation: "š", russianTranslation: "ш", animals: ["Շուն", "Շոկոլադ", "Շինարար"]),
        Letter(character: "Ո", englishTranslation: "o", russianTranslation: "во", animals: ["Ոզնի", "Ոսկե", "Ոտք", "Ոստիկանություն"]),
        Letter(character: "Չ", englishTranslation: "č‘", russianTranslation: "ч", animals: ["Չար", "Չորս"]),
        Letter(character: "Պ", englishTranslation: "p", russianTranslation: "п", animals: ["Պատառաքաղ", "Պանիր", "Պատ", "Պատուհան"]),
        Letter(character: "Ջ", englishTranslation: "ǰ", russianTranslation: "дж", animals: ["Ջուր", "Ջոկер", "Ջազ"]),
        Letter(character: "Ռ", englishTranslation: "r̄", russianTranslation: "р", animals: ["Ռադիո", "Ռետին", "Ռակետ"]),
        Letter(character: "Ս", englishTranslation: "s", russianTranslation: "с", animals: ["Սունկ", "Սարդ", "Սխտոր", "Սեր"]),
        Letter(character: "Վ", englishTranslation: "v", russianTranslation: "в", animals: ["Վարդ", "Վազ", "Վիրաբույժ"]),
        Letter(character: "Տ", englishTranslation: "t", russianTranslation: "т", animals: ["Տուն", "Տաքսի", "Տատիկ", "Տոմս"]),
        Letter(character: "Ր", englishTranslation: "r", russianTranslation: "р", animals: ["Րումբ"]),
        Letter(character: "Ց", englishTranslation: "c‘", russianTranslation: "ц", animals: ["Ցուլ", "Ցանց"]),
        Letter(character: "Ու", englishTranslation: "w", russianTranslation: "у", animals: ["Ութոտնուկ", "Ուշադրություն", "Ուսուցիչ", "Ութ"]),
        Letter(character: "Փ", englishTranslation: "p‘", russianTranslation: "п", animals: ["Փիղ", "Փետուր", "Փաթիլ", "Փող"]),
        Letter(character: "Ք", englishTranslation: "k", russianTranslation: "к", animals: ["Քար", "Քանոն"]),
        Letter(character: "Եվ", englishTranslation: "ev", russianTranslation: "ев", animals: ["Եվրո", "Եվրոպա"]),
        Letter(character: "Օ", englishTranslation: "ô", russianTranslation: "о", animals: ["Օվկիանոս", "Օդ", "Օտար"]),
        Letter(character: "Ֆ", englishTranslation: "f", russianTranslation: "ф", animals: ["Ֆուտբոլ"])
    ]
}
