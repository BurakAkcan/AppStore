//
//  AppsHeaderHoriziontolController.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

class AppsHeaderHoriziontolController: HorizontolSnappingController {
    
    var socialList: [Social] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppHeaderCell.identifier, for: indexPath) as? AppHeaderCell else {
            return  UICollectionViewCell()
        }
        let item = socialList[indexPath.item]
        cell.setCell(item)
        return cell
    }
}

//MARK: - Extensions

extension AppsHeaderHoriziontolController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (CGFloat.dheight - 2 * 12 - 2 * 10) / 3
        return .init(width: .dWidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 8, bottom: 0, right: 8)
    }
}

private extension AppsHeaderHoriziontolController {
    func configure() {
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: AppHeaderCell.identifier)
    }
}
