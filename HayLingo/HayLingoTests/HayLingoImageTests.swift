//
//  HayLingoImageTests.swift
//  HayLingoTests
//
//  Created by Karen Vardanian on 20.11.2024.
//

import XCTest
@testable import HayLingo

final class HayLingoImageTests: XCTestCase {
    let wordList = ["Աստղ", "Առյուծ", "Արագիլ", "Արջ", "Ամպեր", "Աշխատանք", "Բու", "Բադ", "Բժիշկ", "Գայլ", "Գետ","Դելֆին", "Դդում", "Դանակ","Ելակ", "Եղնիկ", "Երկու","Զեբրա", "Զանգ", "Զառ","Էշ", "էսկիմոս", "էկրա՛ն","Ընձուղտ", "Ընկույз", "Ընտանիք","Թռչուն", "Թուղթ", "Թագ","Ժամացույց", "Ժողով","Ինքնաթիռ", "Ինը","Լամպ", "Լիճ", "Լեռ", "Լավաշ","Խոզ", "Խատուտիկ", "Խոտ","Ծով", "Ծաղիկ", "Ծիծաղ", "Ծառ","Կատու", "Կարուսել", "Կոշիկ", "Կրակ", "Կայծակ","Հավ", "Հաց", "Հովանոց", "Հեքիաթ","Հսկան","Ձուկ", "Ձմեռ", "Ձայն","Ղեկ", "Ղոնդոլ","Ղեկ", "Ղոնդոլ","Ճանապարհ", "Ճանճ", "Ճամպրուկ", "Ճապոնիա","Մուկ", "Մեղու", "Մատիտ", "Մայրիկ", "Մորուք", "Մրջյուն","Յանիվ","Նապաստակ", "Նավ", "Նարինջ", "Նվեր","Շուն", "Շոկոլադ", "Շինարար","Ոզնի", "Ոսկե", "Ոտք", "Ոստիկանություն","Չար", "Չորս","Պատառաքաղ", "Պանիր", "Պատ", "Պատուհան","Ջուր", "Ջոկեր", "Ջազ","Ռադիո", "Ռետին", "Ռակետ","Սունկ", "Սարդ", "Սխտոր", "Սեր","Վարդ", "Վազ", "Վիրաբույժ","Տուն", "Տաքսի", "Տատիկ", "Տոմս","Րումբ","Ցուլ", "Ցանց","Ութոտնուկ", "Ուշադրություն", "Ուսուցիչ", "Ութ","Փիղ", "Փետուր", "Փաթիլ", "Փող","Քար", "Քանոն","Եվրո", "Եվրոպա","Օվկիանոս", "Օդ", "Օտար","Ֆուտբոլ"]
    
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
    
    func testAllImagesExist() {
        for (_, images) in animals {
            for imageName in images {
                let image = UIImage(named: imageName)
                XCTAssertNotNil(image, "Image named: \(imageName) is missing.")
            }
        }
    }
    
//    func testAllImagesExis() {
//        for word in wordList {
//            let image = UIImage(named: word)
//            XCTAssertNotNil(image, "Image named: \(word.lowercased()) is missing.")
//        }
//    }
}