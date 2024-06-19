//
//  ListOfProductsTableViewCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

class ListOfProductsCell: UITableViewCell {
    let activityIndicator = ActivityIndicatorCustom()
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
            genderPDVC.label,
            imagePDVC.imageView,
            activityIndicator.indicatorView,
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
    
    private func configureCell() {
        
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
    
    private func configureVStackForDetails() {
        vStackForProductDetails.stack.axis = .vertical
        vStackForProductDetails.stack.alignment = .leading
        vStackForProductDetails.stack.distribution = .fillEqually
        vStackForProductDetails.stack.spacing = 10
    }
    
    private func layoutCell() {
        let activityIndicator = activityIndicator.indicatorView
        let imagePDVC = imagePDVC.imageView
        let vStackForProductDetails = vStackForProductDetails.stack
        
        NSLayoutConstraint.activate([
            
            imagePDVC.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imagePDVC.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagePDVC.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            imagePDVC.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            
            activityIndicator.centerXAnchor.constraint(equalTo: imagePDVC.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imagePDVC.centerYAnchor),
            
            vStackForProductDetails.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            vStackForProductDetails.leadingAnchor.constraint(equalTo: imagePDVC.trailingAnchor, constant: 10),
            vStackForProductDetails.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            vStackForProductDetails.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            vStackForProductDetails.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
    
    //MARK: - load image url
    func loadImage(from url: URL) {
        imagePDVC.imageView.isHidden = true
        activityIndicator.indicatorView.isHidden = false
        activityIndicator.indicatorView.startAnimating()
        
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.imagePDVC.imageView.isHidden = false
                    self?.activityIndicator.indicatorView.isHidden = true
                    self?.activityIndicator.indicatorView.stopAnimating()
                    self?.imagePDVC.imageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self?.imagePDVC.imageView.isHidden = false
                    self?.activityIndicator.indicatorView.isHidden = true
                    self?.activityIndicator.indicatorView.stopAnimating()
                    self?.imagePDVC.imageView.image = UIImage(systemName: "xmark.square")
                }
            }
        }
    }
    
    //MARK: - Labels size
    private func labelsSize(_ labels: LabelViewCustom) {
        labels.label.font = UIFont.systemFont(ofSize: Helper.Fonts.dynamicFontSize(14))
    }
    
}
