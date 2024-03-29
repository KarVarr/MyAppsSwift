//
//  MyListData.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import Foundation

class ListDataModel {
    var title: String?
    var description: String?
    var creationDate: Date?
    var likes: Int?
    
    init(title: String? = nil, description: String? = nil, date: Date? = nil, likes: Int? = 0) {
        self.title = title
        self.description = description
        self.creationDate = date
        self.likes = likes
    }
}
