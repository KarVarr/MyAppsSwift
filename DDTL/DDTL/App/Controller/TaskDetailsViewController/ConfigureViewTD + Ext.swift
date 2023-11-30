//
//  ConfigureViewTD + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 23.11.2023.
//

import UIKit


extension TaskDetailsViewController {
    override func configureView() {
        view.backgroundColor = Helper.Colors.black
        
        navigationTitle.label.text = "D E T A I L S"
        navigationTitle.label.textColor = Helper.Colors.placeholder
        navigationTitle.label.font = Helper.Fonts.BungeeShadeRegular(with: 24)
        
        customViewForTitleAndDescription.view.backgroundColor = .white
        customViewForTitleAndDescription.view.layer.cornerRadius = 35
        
        customViewForDateAndLikes.view.backgroundColor = .white
        customViewForDateAndLikes.view.layer.cornerRadius = 35
        
        taskTitle.label.text = selectedTask?.title
        taskDescription.label.text = selectedTask?.description
        if #available(iOS 15.0, *) {
            taskDate.label.text = selectedTask?.creationDate?.formatted()
        } 
        taskLikes.label.text = "\(selectedTask?.likes ?? 0)"
    }
    

    
}
