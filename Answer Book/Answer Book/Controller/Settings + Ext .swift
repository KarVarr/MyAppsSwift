//
//  Settings + Ext .swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

extension MainViewController {
    
    func settingView() {
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = Helper.Colors.darkViolet
        
        answerLabel.label.text = "8"
        answerLabel.label.font = UIFont.systemFont(ofSize: dynamicFontSize(72))
    }
    
    
    //MARK: - Dynamic Font size
    func dynamicFontSize(_ FontSize: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let calculatedFontSize = screenWidth / 375 * FontSize
        return calculatedFontSize
    }
    
    //MARK: - Functions
     func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: Date())
    }
    
  
}
