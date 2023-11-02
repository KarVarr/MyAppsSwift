//
//  MyListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit

class MyListViewController: BaseViewController {
    let customTableView = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        setNavTitle(title: .myListViewController)
        customTableView.table.delegate = self
        customTableView.table.dataSource = self
        customTableView.table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        customTableView.table.frame = view.bounds

        view.addSubview(customTableView.table)
    }


}

extension MyListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "number - \(indexPath.row)"
        
        return cell
    }
    
    
}



