//
//  Helper.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import Foundation


enum Helper {
    enum URL {
        static let nasaPictureOfTheDayUrl = "https://api.nasa.gov/planetary/apod?api_key=\(Keys.nasaApiKey)"
    }
    
    enum String {
        static let titlePictureOfTheDay = "Picture of The Day"
    }
}
