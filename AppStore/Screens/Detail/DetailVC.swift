//
//  DetailVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 27.10.2022.
//

import UIKit

protocol DetailVCInterface: AnyObject {
    func configureVC()
}

class DetailVC: BaseCollectionViewController {
    
    private let detailViewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.delegate = self
        detailViewModel.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func setId(_ id: String?) {
        detailViewModel.appId = id
    }
    func registerCollectionCell() {
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
    }
}

//Extensions

extension DetailVC: DetailVCInterface {
    func configureVC() {
        collectionView.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        registerCollectionCell()
    }
    
}

extension DetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 300)
    }
}
