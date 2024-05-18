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
        return dataManager.scannedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.scanVCCellKey, for: indexPath) as? ScanTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        
        let scannedProductIndex = dataManager.scannedProducts[indexPath.row]
        
        //Date
        if let firstProduct = scannedProductIndex.first, let addedAt = firstProduct.addedAt {
          let formatter = DateFormatter()
          formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
          let dateString = formatter.string(from: addedAt)
          cell.titleLabel.label.text = "Создан: \(dateString)"
        } else {
            cell.titleLabel.label.text = "Создан: (нет информации)"
        }
        
        cell.countLabel.label.text = "Количество артикулов: \(scannedProductIndex.count)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedProduct = dataManager.scannedProducts[indexPath.row]
        
        let listOFProductsVC = ListOfProductsVC()
        listOFProductsVC.product = selectedProduct
        
        navigationController?.pushViewController(listOFProductsVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataManager.scannedProducts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
