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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(frame: CGRect, imgURL: String) {
        super.init(frame: frame)
        setupImage()
        setupView()
        configureImageView(with: imgURL)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.isSkeletonable = true
    }
    
    private func setupImage() {
        imageView.isSkeletonable = true
        addSubview(imageView)
    }
    
    private func configureImageView(with urlString: String) {
        if let url = URL(string: urlString) {
            loadImage(from: url)
        } else {
            imageView.image = UIImage(named: "photo")
            stopSkeleton()
        }
    }
    // MARK: - Start Skeleton
    private func startSkeleton() {
        self.showAnimatedGradientSkeleton()
        self.imageView.showAnimatedGradientSkeleton()
    }
    
    // MARK: - Stop Skeleton
    private func stopSkeleton() {
        self.hideSkeleton()
        self.imageView.hideSkeleton()
    }
    
    private func loadImage(from url: URL) {
        startSkeleton()
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                    self?.stopSkeleton()
                }
            } else {
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(named: "photo")
                    self?.stopSkeleton()
                }
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.widthAnchor.constraint(equalToConstant: 270),
        ])
    }
}

