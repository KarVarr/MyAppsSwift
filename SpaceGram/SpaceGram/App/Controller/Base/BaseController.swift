//
//  BaseController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 30.09.2023.
//

import UIKit


enum NavBarPosition {
    case left
    case right
}


class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        settingView()
        layoutView()
        
    }
}

@objc extension BaseController {
    func addSubviews() {}
    func settingView() {}
    func layoutView() {}
   
    func nabBarLeftButtonHandler() {
        print("Left tapped")
    }
    func nabBarRightButtonHandler() {
        print("Right tapped")
    }
}

extension BaseController {
    func setNavTitle(title: Tabs) {
//        let titleText: String
        
//        switch title {
//        case .pictureOfDay:
//            titleText = "Photo".uppercased()
//        case .planets:
//            titleText = "Planets".uppercased()
//        case .images:
//            titleText = "Images".uppercased()
//        case .peoples:
//            titleText = "Peoples".uppercased()
//        }
    
        navigationItem.title = Helper.Strings.NavBar.title(for: title)
    }
    
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Helper.Colors.lightOrange, for: .normal)
        button.setTitleColor(Helper.Colors.darkBlue, for: .disabled)
        button.titleLabel?.font = Helper.Font.AppleSDGothicNeoBold(with: 17)
        
        switch position {
        case .left :
            button.addTarget(self, action: #selector(nabBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(nabBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
        
    }
}
