//
//  HorizontolSnappingController.swift
//  AppStore
//
//  Created by Burak AKCAN on 26.10.2022.
//

import Foundation
import UIKit

class HorizontolSnappingController: UICollectionViewController {
    init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
