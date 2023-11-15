//
//  MyListData.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import Foundation


class MyListData {
    var title: String? 
    var description: String?
    var date: Date?
    var likes: Int?
    
    init(title: String? = nil, description: String? = nil, date: Date? = nil, likes: Int? = nil) {
        self.title = title
        self.description = description
        self.date = date
        self.likes = likes
    }
}
