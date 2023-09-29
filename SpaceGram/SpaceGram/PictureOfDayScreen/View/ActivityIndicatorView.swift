//
//  ActivityIndicatorView.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit

class ActivityIndicatorView {
    let indicator: UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        indicator.color = .purple
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        return indicator
    }()
}
