//
//  PreviewScreenContrller.swift
//  AppStore
//
//  Created by Burak AKCAN on 28.10.2022.
//

import Foundation
import UIKit

class PreviewScreenController: HorizontolSnappingController {
    
    var app: Itune?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ScreenCell.self, forCellWithReuseIdentifier: ScreenCell.identifier)
        configureScreenController()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenCell.identifier, for: indexPath) as! ScreenCell
        if let item = app?.screenshotUrls[indexPath.item] {
            cell.setCell(urlString: item)
        }
        return cell
    }
    
    private func configureScreenController() {
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.contentInset = .init(top: 8, left: 16, bottom: 8, right: 16)
    }
}

//MARK: - Extensions

extension PreviewScreenController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 250, height: view.frame.height )
    }
    
}
