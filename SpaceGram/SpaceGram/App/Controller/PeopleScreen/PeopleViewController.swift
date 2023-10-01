//
//  PeopleViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 29.09.2023.
//

import UIKit

class PeopleViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .turquoise
        setNavTitle(title: .peoples)
        
    }
    

    deinit {
        print("Peoples VC deinit")
    }

}
