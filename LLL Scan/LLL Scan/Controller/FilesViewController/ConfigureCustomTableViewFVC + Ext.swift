//
//  ConfigureCustomTableViewFVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit

extension FilesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.scanVCCellKey, for: indexPath) as? ScanTableViewCell else {
            return UITableViewCell()
        }
        
        
        return cell
    }
    
    
}
