//
//  AppsHorizontolCollection.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

class AppsHorizontolCollection: HorizontolSnappingController {
    
    var feedGroup: FeedResponse?
    
    var didSelectHandler: ((AppResult?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: AppsRowCell.identifier)
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let appGroup = feedGroup {
            return appGroup.results.count
        }else{
            return 0    
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsRowCell.identifier, for: indexPath) as! AppsRowCell
        if let appGroup = feedGroup {
            let item = appGroup.results[indexPath.item]
            cell.setCell(item)
        }
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = feedGroup?.results[indexPath.item] {
            didSelectHandler?(app)
        }
    }
}

extension AppsHorizontolCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let  height: CGFloat = (view.frame.height - 20 - 20 - 20) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 12 , right: 16)
    }
}
