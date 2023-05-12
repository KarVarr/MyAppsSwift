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
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: Helpers.Keys.collectionCell)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
}
