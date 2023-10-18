//
//  Stars + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 18.10.2023.
//

import UIKit


extension PictureOfDayViewController {
    //MARK: - Making a Stars
    private func removeStars() {
        for subview in starsView.view.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func makeStars() {
        removeStars()
        
        starsView.view.layer.removeAllAnimations()
        starsView.view.backgroundColor = .clear
        starsView.view.frame = view.bounds
        
        for _ in 0..<60 {
            let star = UIView()
            star.backgroundColor = Helper.Colors.lightYellow
            star.layer.shadowOffset = .zero
            star.layer.shadowColor = Helper.Colors.white.cgColor
            star.layer.shadowRadius = 4
            
            
            let x = CGFloat.random(in: 0..<starsView.view.bounds.width)
            let y = CGFloat.random(in: 0..<starsView.view.bounds.height)
            let intRandom = CGFloat.random(in: 1..<6)
            star.frame = CGRect(x: x, y: y, width: intRandom, height: intRandom)
            star.layer.cornerRadius = star.bounds.width / 2
            
            starsView.view.addSubview(star)
            
            //Animation
            view.layoutIfNeeded()
            UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse]) {
                star.backgroundColor = Helper.Colors.yellow
                star.layer.shadowOpacity = 3
                self.view.layoutIfNeeded()
            }
        }
    }
}
