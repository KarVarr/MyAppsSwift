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
        customTableViewProductDetailsVC.table.register(ProductDetailsCellHeader.self, forHeaderFooterViewReuseIdentifier: Helper.Keys.productDetailsCellHeader)
        customTableViewProductDetailsVC.table.frame = view.bounds
//        customTableViewProductDetailsVC.table.backgroundColor = .white
//        customTableViewProductDetailsVC.table.rowHeight = UITableView.automaticDimension
//        customTableViewProductDetailsVC.table.estimatedRowHeight = 100 
        

        //        customTableViewProductDetailsVC.table.backgroundColor = .white
        //        customTableViewProductDetailsVC.table
        //        customTableViewProductDetailsVC.table.rowHeight = UITableView.automaticDimension
        //        customTableViewProductDetailsVC.table.estimatedRowHeight = 44
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Helper.Keys.productDetailsCellHeader) as? ProductDetailsCellHeader else {
            fatalError("header fail")
        }
        
        let headerTitle = sectionHeader[section].title
        header.configure(with: headerTitle)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Helper.Keys.productDetails, for: indexPath) as? ProductDetailsCell else {
            return UITableViewCell()
        }
        
        let sectionIndex = indexPath.section
        
        switch sectionIndex {
        case 0:
            cell.configure(with: "\(product?.article ?? "Нет артикула")")
        case 1:
            cell.configure(with: "\(product?.title ?? "Нет названия")")
        case 2:
            cell.configure(with: "\(product?.colorID ?? "Нет цвета")")
        case 3:
            cell.configure(with: "\(product?.material ?? "Нет состава")")
        case 4:
            cell.configure(with: "\(product?.description ?? "Нет описания")")
        case 5:
            cell.configure(with: "\(product?.price ?? "Нет цены")")
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
