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
        
        view.addSubview(viewBoxForAnswer.viewBox)
        viewBoxForAnswer.viewBox.addSubview(magicBallImage.imageContainer)
        viewBoxForAnswer.viewBox.addSubview(magicBallInside.viewBox)
        viewBoxForAnswer.viewBox.addSubview(answerLabel.label)
        
        view.addSubview(askButton.button)
    }
    
    func settingView() {
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = Helper.Colors.darkViolet
        
        answerLabel.label.text = "8"
        answerLabel.label.font = UIFont.systemFont(ofSize: 72)
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
        
        quotesLabelForQuote.label.font = Helper.Font.americanTypewriter(with: 20)
        
        quotesLabelForAuthor.label.font = Helper.Font.snellRoundhand(with: 20)
        quotesLabelForAuthor.label.textColor = .white.withAlphaComponent(0.9)
    }
    //MARK: - Answer
    func settingsForAnswer() {
        viewBoxForAnswer.viewBox.backgroundColor = .clear
        
        answerLabel.label.textColor = .tertiarySystemGroupedBackground
        
        magicBallInside.viewBox.layer.cornerRadius = magicBallInside.viewBox.bounds.width / 2
        
        DispatchQueue.main.async { [weak self] in
            self?.magicBallImage.imageContainer.image = UIImage(named: "ball")
        }
        magicBallImage.imageContainer.layer.shadowOpacity = 10
        magicBallImage.imageContainer.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        magicBallImage.imageContainer.layer.shadowRadius = 20
        magicBallImage.imageContainer.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    
    //MARK: - Blur Effect
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
        circleLayer.masksToBounds = true
        
        circle.viewBox.layer.addSublayer(circleLayer)
    }
}
