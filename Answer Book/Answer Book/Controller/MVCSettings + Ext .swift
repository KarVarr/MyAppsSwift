//
//  MVCSettings + Ext .swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

extension MainViewController {
    
    
    func addSubviews() {
        view.addSubview(topCornerCircle.viewBox)
        view.addSubview(bottomCornerCircle.viewBox)
        view.addSubview(quoteViewBox.viewBox)
        quoteViewBox.viewBox.addSubview(activityIndicator.indicator)
        quoteViewBox.viewBox.addSubview(titleLabel.label)
        quoteViewBox.viewBox.addSubview(dateLabel.label)
        quoteViewBox.viewBox.addSubview(quoteLabel.label)
        quoteViewBox.viewBox.addSubview(authorLabel.label)
        
        view.addSubview(answerViewBox.viewBox)
        answerViewBox.viewBox.addSubview(magicBallImage.imageContainer)
        answerViewBox.viewBox.addSubview(circleInsideBall.viewBox)
        answerViewBox.viewBox.addSubview(answerLabel.label)
        
        view.addSubview(shakeButton.button)
    }
    
    func settingView() {
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = Helper.Colors.darkViolet
        
        answerLabel.label.text = "8"
        answerLabel.label.font = UIFont.systemFont(ofSize: dynamicFontSize(72))
    }
    
    //MARK: - Quotes
    func configureQuotesViews() {
        quoteViewBox.viewBox.clipsToBounds = true
        quoteViewBox.viewBox.layer.cornerRadius = 30
        quoteViewBox.viewBox.layer.borderWidth = 1
        quoteViewBox.viewBox.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        
        titleLabel.label.text = Helper.String.quotesTitle
        titleLabel.label.font = Helper.Font.gillSansBold(with: dynamicFontSize(16))
        
        dateLabel.label.text = getCurrentDate()
        dateLabel.label.font = Helper.Font.gillSansBold(with: dynamicFontSize(12))
        dateLabel.label.textColor = .white.withAlphaComponent(0.5)
        
        quoteLabel.label.font = Helper.Font.americanTypewriter(with: dynamicFontSize(20))
        quoteLabel.label.adjustsFontSizeToFitWidth = true
        
        
        authorLabel.label.font = Helper.Font.snellRoundhand(with: dynamicFontSize(20))
        authorLabel.label.textColor = .white.withAlphaComponent(0.9)
    }
    
    //MARK: - Answer
    func configureAnswerView() {
        answerViewBox.viewBox.backgroundColor = .clear
        
        answerLabel.label.textColor = .tertiarySystemGroupedBackground
    
        circleInsideBall.viewBox.layer.cornerRadius = circleInsideBall.viewBox.bounds.width / 2
        
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
        blurView.frame = quoteViewBox.viewBox.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = quoteViewBox.viewBox.bounds
        gradientLayer.colors = Helper.Colors.whiteGradient
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.25)
        
        quoteViewBox.viewBox.addSubview(blurView)
        quoteViewBox.viewBox.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //MARK: - Button
    func configureShakeButton() {
        shakeButton.button.layer.cornerRadius = shakeButton.button.frame.height / 2
        shakeButton.button.addTarget(self, action: #selector(shakeButtonPressed), for: .touchUpInside)
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
    private func dynamicFontSize(_ FontSize: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let calculatedFontSize = screenWidth / 375 * FontSize
        return calculatedFontSize
    }
    
    //MARK: - Functions
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: Date())
    }
    
    
    func dynamicWidth() -> Double {
        var width = 0.0
        if UIDevice.current.userInterfaceIdiom == .phone {
            width = 0.45
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            width = 0.3
        }
        return width
    }
  
}
