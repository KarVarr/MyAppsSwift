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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scannedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.scanVCCellKey, for: indexPath) as? ScanTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        
        let scanIndex = indexPath.row + 1
        cell.titleLabel.label.text = "☑️ Список № \(scanIndex)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedProduct = scannedProducts[indexPath.row]
        
        let productDetailVC = ProductDetailVC()
        productDetailVC.product = selectedProduct
        
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
    
    
}
