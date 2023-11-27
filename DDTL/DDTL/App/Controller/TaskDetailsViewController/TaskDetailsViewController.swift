//
//  TaskDetailsViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 22.11.2023.
//

import Foundation


class TaskDetailsViewController: BaseViewController {
    
    let navigationTitle = CustomLabelView()
    let customViewForTitleAndDescription = CustomView()
    let customViewForDateAndLikes = CustomView()
    
    let taskTitle = CustomLabelView()
    let taskDescription = CustomLabelView()
    let taskDate = CustomLabelView()
    let taskLikes = CustomLabelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
