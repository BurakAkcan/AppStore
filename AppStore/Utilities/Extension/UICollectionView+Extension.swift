//
//  UICollectionView+Extension.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

extension UICollectionView {
    func reloadCollectionViewOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

