//
//  TodayMultipleController.swift
//  AppStore
//
//  Created by Burak AKCAN on 8.11.2022.
//

import UIKit

class TodayMultipleController: BaseCollectionViewController {
    
    fileprivate let spacing: CGFloat = 16
    fileprivate var height: CGFloat!

    
    var appList: [AppResult] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    }
    
    private
    func configureCollection() {
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: MultipleAppCell.idetifier)
        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         min(4, appList.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleAppCell.idetifier, for: indexPath) as? MultipleAppCell else { return UICollectionViewCell() }
        let item = appList[indexPath.item]
        cell.setCell(item)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Add similar codes AppsHorizontolColection
    }

}

extension TodayMultipleController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        height = (view.frame.height - 3*spacing) / 4
       return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 4, left: 8, bottom: 4, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}
