//
//  ConfigureCustomTableViewSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

extension ScanVC: UITableViewDelegate, UITableViewDataSource {
    func configureCustomTableViewSVC() {
        customTableViewScanVC.table.dataSource = self
        customTableViewScanVC.table.delegate = self
        customTableViewScanVC.table.register(ScanTableViewCell.self, forCellReuseIdentifier: Helper.Keys.scanVCCellKey)
        customTableViewScanVC.table.frame = view.bounds
        customTableViewScanVC.table.backgroundColor = .white
        customTableViewScanVC.table.separatorStyle = .singleLine
        customTableViewScanVC.table.separatorColor = .orange
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = dataManager.allProducts.count
        if count == 0 {
            emptyStateImageView.imageView.isHidden = false
        } else {
            emptyStateImageView.imageView.isHidden = true
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.scanVCCellKey, for: indexPath) as? ScanTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        
        let productList = dataManager.loadAllProductLists()[indexPath.row]
        let index = indexPath.row + 1
        cell.titleLabel.label.text = productList.titleForCell.isEmpty ? "Создан: \(Helper.Dates.formatDate(productList.products.first?.addedAt))" : "\(index): \(productList.titleForCell)"
        
        cell.countLabel.label.text = "Количество артикулов: \(productList.products.count)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedProduct = dataManager.loadAllProductLists()[indexPath.row]
        
        let listOFProductsVC = ListOfProductsVC()
        listOFProductsVC.product = Array(selectedProduct.products)
        listOFProductsVC.productListIndex = indexPath.row
        listOFProductsVC.titleForProduct = selectedProduct.titleForCell
        navigationController?.pushViewController(listOFProductsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataManager.deleteProductList(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            customTableViewScanVC.table.reloadData()
        }
    }
}
