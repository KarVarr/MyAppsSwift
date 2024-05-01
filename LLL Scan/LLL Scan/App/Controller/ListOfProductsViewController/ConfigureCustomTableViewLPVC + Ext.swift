//
//  ConfigureCustomTableViewLPVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

extension ListOfProductsVC: UITableViewDelegate, UITableViewDataSource {
    func configureCustomTableViewLPVC() {
        customTableViewProductDetailVC.table.dataSource = self
        customTableViewProductDetailVC.table.delegate = self
        customTableViewProductDetailVC.table.register(ListOfProductsCell.self, forCellReuseIdentifier: Helper.Keys.listOfProducts)
        customTableViewProductDetailVC.table.frame = view.bounds
        customTableViewProductDetailVC.table.backgroundColor = .white
        customTableViewProductDetailVC.table.separatorStyle = .singleLine
        customTableViewProductDetailVC.table.separatorColor = .purple
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.listOfProducts, for: indexPath) as? ListOfProductsCell else {
            return UITableViewCell()
        }
        
        let productIndex = product[indexPath.row]
        
        if let imageURLString = productIndex.imageURL,
           let decodedImageURLString = imageURLString.removingPercentEncoding,
           let imageURL = URL(string: "https:"+decodedImageURLString) {
            cell.loadImage(from: imageURL)
        }
        
        cell.articleLabelPDVC.label.text = productIndex.article
        cell.titleLabelPDVC.label.text = productIndex.title
        cell.colorLabelPDVC.label.text = productIndex.colorID
        cell.materialLabelPDVC.label.text = productIndex.material
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedProduct = product[indexPath.row]
        
        let productDetailsVS = ProductDetailsVC()
        productDetailsVS.product = selectedProduct
        productDetailsVS.title = selectedProduct.article
        navigationController?.pushViewController(productDetailsVS, animated: true)
    }
}
