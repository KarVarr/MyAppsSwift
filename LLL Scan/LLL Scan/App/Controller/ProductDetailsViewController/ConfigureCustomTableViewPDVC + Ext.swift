//
//  ConfigureCustomTableViewPDVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit
import SkeletonView

extension ProductDetailsVC: UITableViewDelegate, SkeletonTableViewDataSource {
    
    func configureCustomTableViewPDVC() {
        customTableViewProductDetailsVC.table.dataSource = self
        customTableViewProductDetailsVC.table.delegate = self
        customTableViewProductDetailsVC.table.register(ProductDetailsCell.self, forCellReuseIdentifier: Helper.Keys.productDetails)
        customTableViewProductDetailsVC.table.register(ProductDetailsCellHeader.self, forHeaderFooterViewReuseIdentifier: Helper.Keys.productDetailsCellHeader)
        customTableViewProductDetailsVC.table.frame = view.bounds
        customTableViewProductDetailsVC.table.rowHeight = UITableView.automaticDimension
        customTableViewProductDetailsVC.table.estimatedRowHeight = 100
        
        
        let tableViewHeader = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 400), imgURL: String(product?.mainImageURL?.dropFirst(6) ?? "xmark.square"))
        print("HERE IS PHORORORORO \(product?.mainImageURL)")
        self.customTableViewProductDetailsVC.table.tableHeaderView = tableViewHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionIndex = indexPath.section
        
        switch sectionIndex {
        case 3:
            return CGFloat((product?.material?.count ?? 44) + 22)
        case 4:
            return CGFloat((product?.descriptions?.count ?? 44))
        default:
            return 44
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        Helper.Keys.productDetails
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
            cell.configure(with: "\(product?.colorName ?? "Нет цвета")")
        case 3:
            cell.configure(with: "\(product?.material ?? "Нет состава")")
        case 4:
            cell.configure(with: "\(product?.descriptions ?? "Нет описания")")
        case 5:
            cell.configure(with: "\(product?.price ?? "Нет цены")")
        case 6:
            cell.configure(with: "\(product?.gender ?? "Нет пола")")
        case 7:
            cell.configure(with: "\(product?.babyGender ?? "Нет данных")")
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
