//
//  ReviewHorizontolController.swift
//  AppStore
//
//  Created by Burak AKCAN on 28.10.2022.
//

import UIKit

class ReviewHorizontolController: HorizontolSnappingController {
    
    var entryList: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        collectionView.register(ReviewHorizontolCell.self, forCellWithReuseIdentifier: ReviewHorizontolCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    //change
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        entryList.count 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewHorizontolCell.identifier, for: indexPath) as! ReviewHorizontolCell
        cell.setCell(entryList[indexPath.item])
        return cell
    }
    
}
//MARK: - Extensions

extension ReviewHorizontolController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width - 50, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}
