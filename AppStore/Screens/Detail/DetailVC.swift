//
//  DetailVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 27.10.2022.
//

import UIKit

protocol DetailVCInterface: AnyObject {
    func configureVC()
    func reloadCollectionView()
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
        if let item = detailViewModel.cellForItemAt() {
            cell.setCell(item)
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
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func configureVC() {
        collectionView.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        registerCollectionCell()
    }
    
}

extension DetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Calculate the necessary size for our cell
        let dummyCell = DetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
        //immediately force update view
        dummyCell.layoutIfNeeded()
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        
        return .init(width: view.frame.width, height: estimatedSize.height)
    }
}
