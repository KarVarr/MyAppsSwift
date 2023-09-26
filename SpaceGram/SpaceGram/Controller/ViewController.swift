//
//  ViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let dataFetcher = DataFetcher()
    
    let scrollView = CustomScrollView()
    
    let verticalStackView = CustomStackView()
    var pictureOfDayImageView = CustomImageView()
    var titleLabel = CustomLabel()
    var dateLabel = CustomLabel()
    var explanationLabel = CustomLabel()
    
    let separateLineForToolbar = CustomView()
    let customToolbar = CustomView()
    
    let urlNasa = "https://api.nasa.gov/planetary/apod?api_key=kOZ9oe3uvIOL9jm2Jjqzesdkl6cp48PWhpsNZLeM"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        settingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPictureOfTheDay()
    }
    
    override func viewWillLayoutSubviews() {
        layoutView()
    }
    
    func addSubviews() {
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(verticalStackView.sView)
        
        verticalStackView.sView.addArrangedSubview(pictureOfDayImageView.customImage)
        verticalStackView.sView.addArrangedSubview(titleLabel.label)
        verticalStackView.sView.addArrangedSubview(dateLabel.label)
        verticalStackView.sView.addArrangedSubview(explanationLabel.label)
        
        view.addSubview(customToolbar.view)
        view.addSubview(separateLineForToolbar.view)
    }
    
    func settingView() {
        view.backgroundColor = .white
        title = "SpaceGram"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        customToolbar.view.backgroundColor = .blue
        separateLineForToolbar.view.backgroundColor = .systemPink.withAlphaComponent(0.5)
        pictureOfDayImageView.customImage.image = UIImage(systemName: "plus")
        scrollView.scroll.showsVerticalScrollIndicator = false
        verticalStackView.sView.alignment = .center
        verticalStackView.sView.axis = .vertical
        verticalStackView.sView.spacing = 20
       
        
        titleLabel.label.text = ""
        dateLabel.label.text = ""
        explanationLabel.label.text = ""
    }
    
    func layoutView() {
        let scrollView = scrollView.scroll
        
        let verticalStackView = verticalStackView.sView
        let pictureOfDayImageView = pictureOfDayImageView.customImage
        //        let titleLabel = titleLabel.label
        //        let dateLabel = dateLabel.label
        let explanationLabel = explanationLabel.label
        
        let separateLineForToolbar = separateLineForToolbar.view
        let customToolbar = customToolbar.view
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: separateLineForToolbar.topAnchor, constant: -20),
            
            verticalStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            pictureOfDayImageView.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            pictureOfDayImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            pictureOfDayImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            
            //            titleLabel.topAnchor.constraint(equalTo: pictureOfDayImageView.bottomAnchor),
            //            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            //            explanationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            explanationLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 20),
            explanationLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -20),
            
            separateLineForToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separateLineForToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separateLineForToolbar.bottomAnchor.constraint(equalTo: customToolbar.topAnchor),
            separateLineForToolbar.heightAnchor.constraint(equalToConstant: 1.0),
            
            customToolbar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customToolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customToolbar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
        ])
    }
    
    
    func fetchPictureOfTheDay () {
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.dataFetcher.decodeAPI(at: self.urlNasa) { (result: Result<AstronomyPictureOfTheDay, Error>) in
                switch result {
                case .success(let pictureOfTheDay):
                    if let imageUrl = URL(string: pictureOfTheDay.url), let imageData = try? Data(contentsOf: imageUrl), let image = UIImage(data: imageData) {
                        
                        DispatchQueue.main.async {
                            self.pictureOfDayImageView.customImage.image = image
                            self.titleLabel.label.text = pictureOfTheDay.title
                            self.dateLabel.label.text = pictureOfTheDay.date
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
