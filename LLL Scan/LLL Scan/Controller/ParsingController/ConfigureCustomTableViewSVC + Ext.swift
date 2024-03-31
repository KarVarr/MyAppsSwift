//
//  ConfigureCustomTableViewSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

extension ScanVC: UITableViewDelegate, UITableViewDataSource {
    func configureCustomTableView() {
        customTableView.table.dataSource = self
        customTableView.table.delegate = self
        customTableView.table.register(ScanTableViewCell.self, forCellReuseIdentifier: Helper.Keys.scanVCCellKey)
        customTableView.table.frame = view.bounds
        customTableView.table.backgroundColor = .cyan
        customTableView.table.separatorStyle = .singleLine
        customTableView.table.separatorColor = .orange
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.scanVCCellKey, for: indexPath) as? ScanTableViewCell else {
            return UITableViewCell()
        }
        
        
        return cell
    }
    
    
}
