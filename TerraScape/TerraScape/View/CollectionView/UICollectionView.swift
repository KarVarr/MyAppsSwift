//
//  UICollectionView.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit

class CustomUICollectionView {
    let customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 1
//        layout.sectionInset = .init(top: 5, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: Helpers.Keys.collectionCell)
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 20
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
        return collectionView
    }()
}
