//
//  TableViewHeader.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 16.06.2024.
//

import UIKit

class TableViewHeader: UIView {
    
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
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        }
    }
    
    private func setupConstraints() {
           addSubview(imageView)
           
           NSLayoutConstraint.activate([
               imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
               imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
               imageView.heightAnchor.constraint(equalToConstant: 400)
           ])
       }
}

