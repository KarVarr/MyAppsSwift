//
//  ConfigureLabelTD + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 02.12.2023.
//

import Foundation

extension TaskDetailsViewController {
    
    func configureLabelTD() {
        let arrayOfLabels = [taskDate.label, taskDescription.label, taskLikes.label, taskTitle.label]
        for labels in arrayOfLabels {
            labels.numberOfLines = 0
        }
        
        navigationTitle.label.text = "D E T A I L S"
        navigationTitle.label.textColor = Helper.Colors.placeholder
        navigationTitle.label.font = Helper.Fonts.BungeeShadeRegular(with: 24)
        
        //MARK: - VIEWS
        customViewForTitleAndDescription.view.backgroundColor = .white
        customViewForTitleAndDescription.view.layer.cornerRadius = 35
        
        customViewForDateAndLikes.view.backgroundColor = .white
        customViewForDateAndLikes.view.layer.cornerRadius = 35
        
        //MARK: - LABELS
        taskTitle.label.text = selectedTask?.title
        taskDescription.label.text = selectedTask?.description?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "No description"
        if selectedTask?.description == "" {
            taskDescription.label.text = "No description"
        }
        taskLikes.label.text = "L I K E S: \n\(selectedTask?.likes ?? 0)"
        if let date = selectedTask?.creationDate {
            taskDate.label.text = "D A T E: \n\(dateFormat(with: date) )"
        }
        
        //TODO: change a fonts and colors for the labels!
    }
    
    
    private func dateFormat(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}
