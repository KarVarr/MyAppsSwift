//
//  ConfigureCustomTableViewLPVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit
import SkeletonView

extension ListOfProductsVC: UITableViewDelegate, SkeletonTableViewDataSource {
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
        return 140
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        Helper.Keys.listOfProducts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.listOfProducts, for: indexPath) as? ListOfProductsCell else {
            return UITableViewCell()
        }
        
        let productIndex = product[indexPath.row]
        
        cell.configureCell(with: productIndex)
        
        if let imageURLString = productIndex.imageURL,
//           let decodedImageURLString = imageURLString.removingPercentEncoding,
           let imageURL = URL(string: imageURLString) {
            cell.loadImage(from: imageURL)
        }
        
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let productListIndex = self.productListIndex else { return }
            dataManager.deleteProduct(at: indexPath.row, inProductListAt: productListIndex)
            product.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
