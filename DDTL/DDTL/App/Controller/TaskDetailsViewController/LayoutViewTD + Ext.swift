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
        let taskTitle = taskTitle.label
        let taskDescription = taskDescription.label
        let taskDate = taskDate.label
        let taskLikes = taskLikes.label
        
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
        
        //MARK: - taskTitle and taskDescription
        NSLayoutConstraint.activate([
            taskTitle.topAnchor.constraint(equalTo: viewForTitle.topAnchor, constant: 30),
            taskTitle.leadingAnchor.constraint(equalTo: viewForTitle.leadingAnchor, constant: 10),
            
            taskDescription.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 30),
            taskDescription.leadingAnchor.constraint(equalTo: viewForTitle.leadingAnchor, constant: 10)
        ])
        
        //MARK: - taskDate and taskLikes
        NSLayoutConstraint.activate([
            taskDate.topAnchor.constraint(equalTo: viewForDate.topAnchor, constant: 30),
            taskDate.leadingAnchor.constraint(equalTo: viewForDate.leadingAnchor, constant: 10),
            
            taskLikes.topAnchor.constraint(equalTo: taskDate.bottomAnchor, constant: 30),
            taskLikes.leadingAnchor.constraint(equalTo: viewForDate.leadingAnchor, constant: 10)
        ])
    }
}
