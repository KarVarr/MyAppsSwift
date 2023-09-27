//
//  PODVCGetData + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit


extension PictureOfDayViewController {
    func fetchPictureOfTheDay () {
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.dataFetcher.decodeAPI(at: self.urlNasa) { (result: Result<AstronomyPictureOfTheDay, Error>) in
                switch result {
                case .success(let pictureOfTheDay):
                    if let imageUrl = URL(string: pictureOfTheDay.url), let imageData = try? Data(contentsOf: imageUrl), let image = UIImage(data: imageData) {
                        
                        DispatchQueue.main.async {
                            self.activityIndicatorViewForPictureOfDay.indicator.stopAnimating()
                            self.pictureOfDayImageView.customImage.image = image
                            self.titleLabel.label.text = "Title: \(pictureOfTheDay.title)"
                            self.dateLabel.label.text = "Date: \(pictureOfTheDay.date)"
                            self.explanationLabel.label.text = pictureOfTheDay.explanation
                            
                        }
                        
                    }
                    
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
        
    }

}
