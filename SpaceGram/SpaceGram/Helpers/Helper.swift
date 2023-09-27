//
//  Helper.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit


enum Helper {
    enum URL {
        static let nasaPictureOfTheDayUrl = "https://api.nasa.gov/planetary/apod?api_key=\(Keys.nasaApiKey)"
    }
    
    enum String {
        static let titlePictureOfTheDay = "Picture of The Day"
    }
    
    enum Colors {
        static let darkBlue = UIColor(red: 0.03, green: 0.10, blue: 0.32, alpha: 1.00)
        static let lightYellow = UIColor(red: 0.95, green: 0.97, blue: 0.63, alpha: 1.00)
        static let lightCyan = UIColor(red: 0.21, green: 0.64, blue: 0.62, alpha: 1.00)
        static let milkWhite = UIColor(red: 1.00, green: 0.96, blue: 0.88, alpha: 1.00)
    }
}
