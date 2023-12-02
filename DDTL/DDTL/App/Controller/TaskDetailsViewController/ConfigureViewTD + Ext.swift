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
        
        taskDescription.label.numberOfLines = 0
        taskDate.label.numberOfLines = 0
        
        taskTitle.label.text = selectedTask?.title
        
        taskDescription.label.text = selectedTask?.description
        taskDescription.label.text = selectedTask?.description ?? "No description"

 
        if let date = selectedTask?.creationDate {
            taskDate.label.text = "D A T E \n\(dateFormat(with: date) )"
        }
        
        taskLikes.label.text = "Likes: \(selectedTask?.likes ?? 0)"
    }
    
    func dateFormat(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
}

