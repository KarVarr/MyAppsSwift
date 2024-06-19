//
//  TableViewHeader.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 16.06.2024.
//

import UIKit
import SkeletonView

class TableViewHeader: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isSkeletonable = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    init(frame: CGRect, imgURL: String) {
        super.init(frame: frame)
        setupView()
        configureImageView(with: imgURL)
        setupConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.isSkeletonable = true
        self.showAnimatedSkeleton()
        addSubview(imageView)
    }
    
    private func configureImageView(with urlString: String) {
        if let url = URL(string: urlString) {
            loadImage(from: url)
        } else {
            stopSkeleton()
            imageView.image = UIImage(named: "photo")
        }
    }
    // MARK: - Start Skeleton
    private func startSkeleton() {
        self.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: UIColor.sunFlower), transition: .crossDissolve(0.25))
    }
    
    // MARK: - Stop Skeleton
    private func stopSkeleton() {
        self.hideSkeleton()
    }
    
    private func loadImage(from url: URL) {
        startSkeleton()
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.stopSkeleton()
                    self?.imageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self?.stopSkeleton()
                    self?.imageView.image = UIImage(named: "photo")
                }
            }
        }
    }
    
    private func setupConstraints() {
//        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
        ])
    }
}

