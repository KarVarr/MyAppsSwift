//
//  TaskDetailsViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 22.11.2023.
//

import Foundation
import UIKit


class TaskDetailsViewController: BaseViewController {
    var selectedTask: ListDataModel?
    
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


