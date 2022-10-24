//
//  BaseCollectionViewController.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
