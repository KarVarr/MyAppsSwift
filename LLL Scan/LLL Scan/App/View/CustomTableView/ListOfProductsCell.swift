//
//  ListOfProductsTableViewCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit
import SkeletonView
import SDWebImage

class ListOfProductsCell: UITableViewCell {
    let articleLabelPDVC = LabelViewCustom()
    let titleLabelPDVC = LabelViewCustom()
    let colorLabelPDVC = LabelViewCustom()
    let materialLabelPDVC = LabelViewCustom()
    let genderPDVC = LabelViewCustom()
    let imagePDVC = ImageViewCustom()
    let vStackForProductDetails = ViewStackCustom()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addViews()
        configureLabels()
        configureVStackForDetails()
        layoutCell()
        setupSkeleton()
    }
    
    private func addViews() {
        let views: [UIView] = [
            articleLabelPDVC.label,
            titleLabelPDVC.label,
            colorLabelPDVC.label,
            materialLabelPDVC.label,
            genderPDVC.label,
            imagePDVC.imageView,
            vStackForProductDetails.stack,
        ]
        
        for addView in views {
            contentView.addSubview(addView)
        }
        
        //MARK: - VStack
        vStackForProductDetails.stack.addArrangedSubview(articleLabelPDVC.label)
        vStackForProductDetails.stack.addArrangedSubview(titleLabelPDVC.label)
        vStackForProductDetails.stack.addArrangedSubview(colorLabelPDVC.label)
        vStackForProductDetails.stack.addArrangedSubview(materialLabelPDVC.label)
        vStackForProductDetails.stack.addArrangedSubview(genderPDVC.label)
    }
    
    private func configureLabels() {
        let labels: [LabelViewCustom] = [
            articleLabelPDVC,
            titleLabelPDVC,
            colorLabelPDVC,
            materialLabelPDVC,
            genderPDVC
        ]
        
        for oneLebel in labels {
            labelsSize(oneLebel)
        }
    }
    
    private func setupSkeleton() {
        self.isSkeletonable = true
        self.imagePDVC.imageView.isSkeletonable = true
    }
    
    private func configureVStackForDetails() {
        vStackForProductDetails.stack.axis = .vertical
        vStackForProductDetails.stack.alignment = .leading
        vStackForProductDetails.stack.distribution = .fillEqually
        vStackForProductDetails.stack.spacing = 10
    }
    
    private func layoutCell() {
        let imagePDVC = imagePDVC.imageView
        let vStackForProductDetails = vStackForProductDetails.stack
        
        NSLayoutConstraint.activate([
            imagePDVC.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imagePDVC.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagePDVC.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            imagePDVC.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            
            vStackForProductDetails.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            vStackForProductDetails.leadingAnchor.constraint(equalTo: imagePDVC.trailingAnchor, constant: 10),
            vStackForProductDetails.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            vStackForProductDetails.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            vStackForProductDetails.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    // MARK: - Start Skeleton
    private func startSkeleton() {
        self.showAnimatedGradientSkeleton()
        self.imagePDVC.imageView.showAnimatedGradientSkeleton()
    }
    
    // MARK: - Stop Skeleton
    private func stopSkeleton() {
        self.hideSkeleton()
        self.imagePDVC.imageView.hideSkeleton()
    }
    
    func configureCell(with product: Product) {
        DispatchQueue.main.async {
            self.articleLabelPDVC.label.text = product.article
            self.titleLabelPDVC.label.text = product.title
            self.colorLabelPDVC.label.text = product.colorName
            self.materialLabelPDVC.label.text = product.material
            self.genderPDVC.label.text = product.gender
        }
    }
    
    //MARK: - load image url
    func loadImage(from url: URL) {
        startSkeleton()
        imagePDVC.imageView.sd_setImage(with: url, placeholderImage: nil, options: [.retryFailed, .refreshCached]) { [weak self] (image, error, cacheType, imageUrl) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to load image with error: \(error.localizedDescription)")
                    self?.imagePDVC.imageView.image = UIImage(systemName: "xmark.square")
                } else {
                    self?.imagePDVC.imageView.image = image
                }
                self?.stopSkeleton()
            }
        }
    }
    
    //MARK: - Labels size
    private func labelsSize(_ labels: LabelViewCustom) {
        labels.label.font = UIFont.systemFont(ofSize: Helper.Fonts.dynamicFontSize(14))
    }
}
