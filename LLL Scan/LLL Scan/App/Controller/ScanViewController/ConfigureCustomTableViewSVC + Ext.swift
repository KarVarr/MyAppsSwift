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
        return allScannedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.scanVCCellKey, for: indexPath) as? ScanTableViewCell else {
            return UITableViewCell()
        }
        
//        let scannedProductCount = allScannedProducts[indexPath.row].count
//        cell.titleLabel.label.text = "Scanned product: \(scannedProductCount)"
        
        cell.titleLabel.label.text = currentCellTitle
        return cell
    }
    
    
    
    
}
