//
//  ConfigureCustomTableViewFVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit

extension FilesVC: UITableViewDelegate, UITableViewDataSource {
    func configureCustomTableViewFVC() {
        customTableViewFilesVC.table.dataSource = self
        customTableViewFilesVC.table.delegate = self
        customTableViewFilesVC.table.register(ListOfProductsCell.self, forCellReuseIdentifier: Helper.Keys.filesVCCellKey)
        customTableViewFilesVC.table.frame = view.bounds
        customTableViewFilesVC.table.backgroundColor = .white
        customTableViewFilesVC.table.separatorStyle = .singleLine
        customTableViewFilesVC.table.separatorColor = .purple
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.filesVCCellKey, for: indexPath) as? FilesTableViewCell else {
            return UITableViewCell()
        }
        
        
        return cell
    }
    
    
}
