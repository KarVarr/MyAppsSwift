//
//  MyListViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit


protocol DataDelegate: AnyObject {
    func didEnterData(title: String?, description: String?, creationDate: Date?, likes: Int?)
}

class MyListViewController: BaseViewController, DataDelegate {
    var myListData: [MyListData] = []
    
    let customTableView = CustomTableView()
    let verticalStackViewForLabelAndPointingFingerImageView = CustomStackView()
    
    let pointingFingerTitle = CustomLabelView()
    let pointingFingerImageView = CustomImageView()
    let addButton = CustomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureCustomTableView()
        
        verticalStackViewForLabelAndPointingFingerImageView.stack.axis = .vertical
        verticalStackViewForLabelAndPointingFingerImageView.stack.alignment = .center
        verticalStackViewForLabelAndPointingFingerImageView.stack.spacing = 10
        verticalStackViewForLabelAndPointingFingerImageView.stack.layer.borderWidth = 3
        
        pointingFingerTitle.label.text = "Add new task"
        pointingFingerTitle.label.font = UIFont.systemFont(ofSize: 28,weight: .bold)
        
        configurePointingFingerImageView()
        addButtonConfigure()

    }
    
    func didEnterData(title: String?, description: String?, creationDate: Date?, likes: Int?) {
        let newTask = MyListData(title: title, description: description, date: creationDate)
        myListData.append(newTask)
        customTableView.table.reloadData()
    }
    
    

  
}





