//
//  ConfigureRefreshControlMLVC + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 22.11.2023.
//

import Foundation

extension MyListViewController {
    func configureRefreshControl() {
        refreshControl.refresh.tintColor = Helper.Colors.pink
        refreshControl.refresh.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc private func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
            self?.customTableView.table.reloadData()
            print("table reloaded from refresh")
            self?.refreshControl.refresh.endRefreshing()
        }
        
        
    }
}
