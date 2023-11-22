//
//  MyListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit


protocol DataDelegate: AnyObject {
    func didEnterData(title: String?, description: String?, creationDate: Date?, likes: Int?)
    func colorChangeForAddButton()
}

class MyListViewController: BaseViewController, DataDelegate {
    var myListData: [MyListData] = []
    var isHiddenStackView = false
    
    let customTableView = CustomTableView()
    
    let refreshControl = CustomRefreshControl()
    let pointingFingerLabelTop = CustomLabelView()
    let pointingFingerLabelMiddle = CustomLabelView()
    let pointingFingerLabelBottom = CustomLabelView()
    let pointingFingerImageView = CustomImageView()
    let addButton = CustomButtonView()
    
    
    var updateTimer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureCustomTableView()
        configureStackView()
        configureLabel()
        configurePointingFingerImageView()
        addButtonConfigure()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customTableView.table.reloadData()
        print("table is reloaded")
        colorChangeForAddButton()
        print("timer is active")
        updateTimer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        animationPointingTitleLabels()
        animationPointingFingerImageView()
        configureRefreshControl()
    }
    
    
    
    func didEnterData(title: String?, description: String?, creationDate: Date?, likes: Int?) {
        let newTask = MyListData(title: title, description: description, date: creationDate)
        myListData.append(newTask)
        
        if !myListData.isEmpty {
            pointingFingerImageView.imageView.isHidden = true
            pointingFingerLabelTop.label.isHidden = true
            pointingFingerLabelMiddle.label.isHidden = true
            pointingFingerLabelBottom.label.isHidden = true
            
        } else {
            pointingFingerImageView.imageView.isHidden = false
            pointingFingerLabelTop.label.isHidden = false
            pointingFingerLabelMiddle.label.isHidden = false
            pointingFingerLabelBottom.label.isHidden = false
            
        }
        
        customTableView.table.reloadData()
    }
    
    @objc func updateTable() {
        customTableView.table.reloadData()
        print("Timer !!! 10 sec refresh table")
    }
    
    
    
    deinit {
        print("deinit")
        updateTimer?.invalidate()
    }
    
}





