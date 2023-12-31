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
    var myListData = ArrayOfListDataModel.shared
    var isHiddenStackView = false
    var updateTimer: Timer?
    
    let customTableView = CustomTableView()
    let refreshControl = CustomRefreshControl()
    let pointingFingerLabelTop = CustomLabelView()
    let pointingFingerLabelMiddle = CustomLabelView()
    let pointingFingerLabelBottom = CustomLabelView()
    let pointingFingerImageView = CustomImageView()
    
    let colorLabel = CustomLabelView()
    
    let addButton = CustomButtonView()
    
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
        updateData()
        print("mylistdata count is \(myListData.arrayOfListDataModel.count)")
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
    
    func updateData() {
        DispatchQueue.main.async {
            self.customTableView.table.reloadData()
        }
    }
    
    //MARK: - DEINIT
    deinit {
        print("deinit")
        updateTimer?.invalidate()
    }
}





