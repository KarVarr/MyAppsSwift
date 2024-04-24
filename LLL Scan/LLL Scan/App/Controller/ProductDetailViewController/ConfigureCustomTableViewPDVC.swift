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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.productDetailVCCellKey, for: indexPath) as? ProductDetailTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabelPDVC.label.text = product[indexPath.row].article
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
