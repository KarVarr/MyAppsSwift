//
//  ActivityIndicatorView.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit


class ActivityIndicatorView {
    let indicator: UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        indicator.color = .white
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        return indicator
    }()
}
