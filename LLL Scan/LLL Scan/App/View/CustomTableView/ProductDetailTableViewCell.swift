//
//  ProductDetailTableViewCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    let articleLabelPDVC = LabelViewCustom()
    let titleLabelPDVC = LabelViewCustom()
    let colorLabelPDVC = LabelViewCustom()
    let materialLabelPDVC = LabelViewCustom()
    let imagePDVC = ImageViewCustom()
    let vStackForProductDetails = ViewStackCustom()
    
    override func awakeFromNib() {
        super.awakeFromNib()    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addViews()
        configureCell()
        configureLabels()
        configureVStackForDetails()
        layoutCell()
    }
    
    private func addViews() {
        let views: [UIView] = [
            articleLabelPDVC.label,
            titleLabelPDVC.label,
            colorLabelPDVC.label,
            materialLabelPDVC.label,
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
        
    }
    
    private func configureCell() {
        
    }
    
    private func configureLabels() {
        
    }
    
    private func configureVStackForDetails() {
        vStackForProductDetails.stack.axis = .vertical
        vStackForProductDetails.stack.alignment = .leading
        vStackForProductDetails.stack.distribution = .fillEqually
        vStackForProductDetails.stack.spacing = 5
    }
    
    private func layoutCell() {
        let imagePDVC = imagePDVC.imageView
        let vStackForProductDetails = vStackForProductDetails.stack
        
        NSLayoutConstraint.activate([
            imagePDVC.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imagePDVC.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagePDVC.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            imagePDVC.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
            
            vStackForProductDetails.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            vStackForProductDetails.leadingAnchor.constraint(equalTo: imagePDVC.trailingAnchor, constant: 10),
            vStackForProductDetails.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            vStackForProductDetails.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            vStackForProductDetails.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
        ])
    }
    
    //MARK: - load image url
    func loadImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.imagePDVC.imageView.image = image
                }
            }
        }
    }
    
}
