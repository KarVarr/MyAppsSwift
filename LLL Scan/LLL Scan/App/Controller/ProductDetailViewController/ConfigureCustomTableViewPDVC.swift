//
//  ConfigureCustomTableViewPDVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

extension ProductDetailVC: UITableViewDelegate, UITableViewDataSource {
    func configureCustomTableViewPDVC() {
        customTableViewProductDetailVC.table.dataSource = self
        customTableViewProductDetailVC.table.delegate = self
        customTableViewProductDetailVC.table.register(ProductDetailTableViewCell.self, forCellReuseIdentifier: Helper.Keys.productDetailVCCellKey)
        customTableViewProductDetailVC.table.frame = view.bounds
        customTableViewProductDetailVC.table.backgroundColor = .white
        customTableViewProductDetailVC.table.separatorStyle = .singleLine
        customTableViewProductDetailVC.table.separatorColor = .purple
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.productDetailVCCellKey, for: indexPath) as? ProductDetailTableViewCell else {
            return UITableViewCell()
        }
        
        let productIndex = product[indexPath.row]
        
//        if let imageURLString = productIndex.imageURL,
//           let decodedImageURLString = imageURLString.removingPercentEncoding,
//           let imageURL = URL(string: "https:"+decodedImageURLString) {
//            URLSession.shared.dataTask(with: imageURL) {data, response, error in
//                if let error = error {
//                    print("Error loading image: \(error)")
//                    return
//                }
//                guard let imageData = data else {
//                    print("No image data received")
//                    return
//                }
//                DispatchQueue.main.async {
//                    cell.articleLabelPDVC.label.text = productIndex.article
//                    cell.titleLabelPDVC.label.text = productIndex.title
//                    cell.colorLabelPDVC.label.text = productIndex.colorID
//                    cell.materialLabelPDVC.label.text = productIndex.material
//                    cell.imagePDVC.imageView.image = UIImage(data: imageData)
//
//                }
//                
//            }
//        }
        cell.articleLabelPDVC.label.text = productIndex.article
        cell.titleLabelPDVC.label.text = productIndex.title
        cell.colorLabelPDVC.label.text = productIndex.colorID
        cell.materialLabelPDVC.label.text = productIndex.material
            
            
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
