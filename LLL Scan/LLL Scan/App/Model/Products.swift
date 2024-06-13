//
//  Products.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import Foundation

struct Product: Codable {
    let id: UUID?
    let imageURL: String?
    let link: String?
    let article: String?
    let title: String?
    let price: String?
    let colorID: String?
    let description: String?
    let material: String?
    let gender: String?
    let babyGender: String?
    let addedAt: Date?
}
