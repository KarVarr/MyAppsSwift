//
//  LayoutViewMVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 23.08.2024.
//

import UIKit

extension MainViewController {
    //MARK: - LAYOUT
    func layoutViewMVC() {
        let collection = uiCollectionView.customCollectionView
        let smallBall = smallBall.customUIView
        let mediumBall = mediumBall.customUIView
        let bigBall = bigBall.customUIView
        let largeBall = largeBall.customUIView
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toolbar.heightAnchor.constraint(equalToConstant: 70),
            
            smallBall.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            smallBall.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            smallBall.widthAnchor.constraint(equalToConstant: 75),
            smallBall.heightAnchor.constraint(equalToConstant: 75),
            
            mediumBall.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mediumBall.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mediumBall.widthAnchor.constraint(equalToConstant: 100),
            mediumBall.heightAnchor.constraint(equalToConstant: 100),
            
            bigBall.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bigBall.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            bigBall.widthAnchor.constraint(equalToConstant: 150),
            bigBall.heightAnchor.constraint(equalToConstant: 150),
            
            largeBall.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            largeBall.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            largeBall.widthAnchor.constraint(equalToConstant: 200),
            largeBall.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
}
