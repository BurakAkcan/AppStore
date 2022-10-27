//
//  AppsHorizontolCollection.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

class AppsHorizontolCollection: HorizontolSnappingController {
    
    var appGroup: FeedResponse?
    
    //    {
    //        didSet {
    //            DispatchQueue.main.async {
    //                self.collectionView.reloadData()
    //            }
    //        }
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: AppsRowCell.identifier)
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let appGroup = appGroup {
            return appGroup.results.count
        }else{
            return 0    
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsRowCell.identifier, for: indexPath) as! AppsRowCell
        if let appGroup = appGroup {
            let item = appGroup.results[indexPath.item]
            cell.setCell(item)
        }
        return cell
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
