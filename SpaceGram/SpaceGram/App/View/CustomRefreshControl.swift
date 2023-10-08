//
//  CustomRefreshControl.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 08.10.2023.
//

import UIKit


class CustomRefreshControl {
    let refresh: UIRefreshControl = {
       let refresh = UIRefreshControl()
        refresh.translatesAutoresizingMaskIntoConstraints = false
        refresh.tintColor = Helper.Colors.lightOrange
        return refresh
    }()
}
