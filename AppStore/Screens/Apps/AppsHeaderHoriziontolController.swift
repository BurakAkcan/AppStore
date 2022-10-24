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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "1", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

//MARK: - Extensions
#warning("cell id yazılcak")
private extension AppsHeaderHoriziontolController {
    func configure() {
        collectionView.backgroundColor = .yellow
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "1")
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}

extension AppsHeaderHoriziontolController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: .dWidth, height: .dheight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 40, left: 10, bottom: 10, right: 10)
    }
}
