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
    
    //MARK: - Circles
    func createCircle(for circle: ViewBoxView, withColor color: UIColor) {
        circle.viewBox.backgroundColor = .clear
        
        let circleLayer = CALayer()
        circleLayer.bounds = circle.viewBox.bounds
        circleLayer.position = CGPoint(x: circle.viewBox.bounds.midX, y: circle.viewBox.bounds.midY)
        circleLayer.cornerRadius = circle.viewBox.bounds.width / 2
        circleLayer.backgroundColor = color.cgColor
        circleLayer.masksToBounds = true
        
        circle.viewBox.layer.addSublayer(circleLayer)
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
    
    //MARK: - Dynamic circle ball width for iPad and iPhone
    func dynamicWidth() -> Double {
        var width = 0.0
        if UIDevice.current.userInterfaceIdiom == .phone {
            width = 0.45
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            width = 0.35
        }
        return width
    }
  
}
