//
//  ActivityIndicatorCustom.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 19.06.2024.
//

import UIKit

class ActivityIndicatorCustom {
    let indicatorView:UIActivityIndicatorView =  {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.startAnimating()
        return indicator
    }()
}
