//
//  MVCSettings + Ext .swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

extension MainViewController {
    
    func addViews() {
        view.addSubview(circleTopCornerQuote.viewBox)
        view.addSubview(circleBottomCornerQuote.viewBox)
        view.addSubview(viewBoxForQuotes.viewBox)
        viewBoxForQuotes.viewBox.addSubview(activityIndicatorView.indicator)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelOfDayTitle.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelOfDayDate.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelForQuote.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelForAuthor.label)
        
        view.addSubview(askButton.button)
        view.addSubview(answerLabel.label)
    }
    
    func settingView() {
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        answerLabel.label.text = "Ask some question!"
    }
    
    //MARK: - Quotes
    func settingsForQuotes() {
        viewBoxForQuotes.viewBox.clipsToBounds = true
        viewBoxForQuotes.viewBox.layer.cornerRadius = 30
        viewBoxForQuotes.viewBox.layer.borderWidth = 1
        viewBoxForQuotes.viewBox.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        
        quotesLabelOfDayTitle.label.text = Helper.String.quotesTitle
        quotesLabelOfDayTitle.label.font = Helper.Font.gillSansBold(with: 16)
        
        quotesLabelOfDayDate.label.text = getDateFromNow()
        quotesLabelOfDayDate.label.font = Helper.Font.gillSansBold(with: 12)
        quotesLabelOfDayDate.label.textColor = .white.withAlphaComponent(0.5)
        
        quotesLabelForQuote.label.numberOfLines = 0
        quotesLabelForQuote.label.textAlignment = .center
        quotesLabelForQuote.label.font = Helper.Font.americanTypewriter(with: 20)
        
        quotesLabelForAuthor.label.font = Helper.Font.snellRoundhand(with: 20)
        quotesLabelForAuthor.label.textColor = .white.withAlphaComponent(0.9)
    }
    
    func blurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = viewBoxForQuotes.viewBox.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewBoxForQuotes.viewBox.bounds
        gradientLayer.colors = Helper.Colors.whiteGradient
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.25)
        
        viewBoxForQuotes.viewBox.addSubview(blurView)
        viewBoxForQuotes.viewBox.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //MARK: - Button
    func settingsForAskButton() {
        askButton.button.backgroundColor = .white
        askButton.button.setTitle("Ask question", for: .normal)
        askButton.button.layer.cornerRadius = askButton.button.frame.height / 2
        askButton.button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
    }
    //MARK: - Circles
    func createCircle(for circle: ViewBoxView, withColor color: UIColor) {
        circle.viewBox.backgroundColor = .clear
        
        let circleLayer = CALayer()
        circleLayer.bounds = circle.viewBox.bounds
        circleLayer.position = CGPoint(x: circle.viewBox.bounds.midX, y: circle.viewBox.bounds.midY)
        circleLayer.cornerRadius = circle.viewBox.bounds.width / 2
        circleLayer.backgroundColor = color.cgColor
        
        circle.viewBox.layer.addSublayer(circleLayer)
    }
}
