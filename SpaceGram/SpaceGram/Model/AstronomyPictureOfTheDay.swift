//
//  AstronomyPictureOfTheDay.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import Foundation


struct AstronomyPictureOfTheDay: Decodable {
    var date: String
    var explanation: String
    var hdurl: String
    var title: String
    var url: String
}
