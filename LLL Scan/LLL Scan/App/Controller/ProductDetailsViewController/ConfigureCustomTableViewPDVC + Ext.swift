//
//  ConfigureCustomTableViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit


extension ProductDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func configureCustomTableViewPDVC() {
        customTableViewProductDetailsVC.table.dataSource = self
        customTableViewProductDetailsVC.table.delegate = self
        customTableViewProductDetailsVC.table.register(ProductDetailsCell.self, forCellReuseIdentifier: Helper.Keys.productDetails)
//        customTableViewProductDetailsVC.table.frame = view.bounds
        customTableViewProductDetailsVC.table.backgroundColor = .white
        customTableViewProductDetailsVC.table.separatorStyle = .singleLine
        customTableViewProductDetailsVC.table.separatorColor = .purple
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.productDetails, for: indexPath) as? ProductDetailsCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
