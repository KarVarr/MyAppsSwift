//
//  LayoutViewTD + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 23.11.2023.
//

import UIKit

extension TaskDetailsViewController {
    override func layoutView() {
        let navigationTitle = navigationTitle.label
        let viewForTitle = customViewForTitleAndDescription.view
        let viewForDate = customViewForDateAndLikes.view
        taskTitle = taskTitle.label
        taskDescription = taskDescription.label
        taskDate = taskDate.label
        taskLikes = taskLikes.label
        
        //MARK: - NAVIGATION TITLE
        NSLayoutConstraint.activate([
            navigationTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
        ])
        
        //MARK: - View For TITLE AND DESCRIPTION
        NSLayoutConstraint.activate([
            viewForTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewForTitle.topAnchor.constraint(equalTo: navigationTitle.bottomAnchor, constant: 25),
            viewForTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            viewForTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            viewForTitle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        ])
        
        //MARK: - View For DATE AND LIKES
        NSLayoutConstraint.activate([
            viewForDate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewForDate.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            viewForDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            viewForDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            viewForDate.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
        ])
    }
}
