//
//  UIHelper.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let width = CGFloat.dWidth
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: width / 1.5)
        return layout
    }
}
