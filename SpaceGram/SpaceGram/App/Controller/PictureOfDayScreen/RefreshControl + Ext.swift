//
//  RefreshControl + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 08.10.2023.
//

import UIKit

extension PictureOfDayViewController {
    func configureRefresh() {
        refreshControl.refresh.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc func refreshData(_ sender: UIRefreshControl) {
        showSkeleton()
        getData()
        
        sender.endRefreshing()
    }
}
