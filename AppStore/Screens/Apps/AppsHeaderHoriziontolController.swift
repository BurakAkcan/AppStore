//
//  AppsHeaderHoriziontolController.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

class AppsHeaderHoriziontolController: BaseCollectionViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppHeaderCell.identifier, for: indexPath) as? AppHeaderCell else {
          return  UICollectionViewCell()
        }
        return cell
    }
}

//MARK: - Extensions
private extension AppsHeaderHoriziontolController {
    func configure() {
        collectionView.backgroundColor = .yellow
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: AppHeaderCell.identifier)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}

extension AppsHeaderHoriziontolController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (CGFloat.dheight - 2 * 12 - 2 * 10) / 3
        return .init(width: .dWidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 12, right: 16)
    }
}
