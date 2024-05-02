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
//        customTableViewProductDetailsVC.table.backgroundColor = .white
        customTableViewProductDetailsVC.table.rowHeight = UITableView.automaticDimension
//        customTableViewProductDetailsVC.table.estimatedRowHeight = 44 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.productDetails, for: indexPath) as? ProductDetailsCell else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.configure(with: "Название: \(product?.title ?? "хуй")")
        case 1:
            cell.configure(with: "Артикул: \(product?.article ?? "тебе")")
        case 2:
            cell.configure(with: "Цвет: \(product?.colorID ?? "а не ")")
        case 3:
            cell.configure(with: "Материалы: \(product?.material ?? "рабочий")")
        case 4:
            cell.configure(with: "Описание: \(product?.description ?? "билд ")")
        case 5:
            cell.configure(with: "Цена: \(product?.price ?? "сука")")
        default:
            break
        }
        
        return cell
    }
}
