//
//  TableViewHeader.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 16.06.2024.
//

import UIKit

class TableViewHeader: UIView {
    let activityIndicator = ActivityIndicatorCustom()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    init(frame: CGRect, imgURL: String) {
        super.init(frame: frame)
        configureImageView(with: imgURL)
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView(with urlString: String) {
        if let url = URL(string: urlString) {
            loadImage(from: url)
        } else {
            imageView.image = UIImage(named: "photo")
        }
    }
    
    private func loadImage(from url: URL) {
        imageView.isHidden = true
        activityIndicator.indicatorView.isHidden = false
        activityIndicator.indicatorView.startAnimating()
        
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.activityIndicator.indicatorView.isHidden = true
                    self?.activityIndicator.indicatorView.stopAnimating()
                    self?.imageView.isHidden = false
                    self?.imageView.image = image
                }
            }
        }
    }
    
    private func setupConstraints() {
        addSubview(imageView)
        addSubview(activityIndicator.indicatorView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            activityIndicator.indicatorView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            activityIndicator.indicatorView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
        ])
    }
}

