//
//  GetData + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit


extension PictureOfDayViewController {
    func fetchPictureOfTheDay () {
        DispatchQueue.global(qos: .userInteractive).async { [unowned self] in
            self.dataFetcher.decodeAPI(at: Helper.URL.nasaPictureOfTheDayUrl) { (result: Result<AstronomyPictureOfTheDay, Error>) in
                switch result {
                case .success(let pictureOfTheDay):
                    if let imageUrl = URL(string: pictureOfTheDay.url), let imageData = try? Data(contentsOf: imageUrl), let image = UIImage(data: imageData) {
                        
                        DispatchQueue.main.async {
                            self.hideSkeleton()
                        
                            self.pictureOfDayImageView.customImage.image = image
                            self.titleLabel.label.text = pictureOfTheDay.title
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
