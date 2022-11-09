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
    //MARK: - Properties
    
    private let detailViewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.delegate = self
        detailViewModel.viewDidLoad()
    }
    
    //MARK: - Methods
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        #warning("Review Reload düzeltilecek")
        collectionView.reloadCollectionViewOnMainThread()
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
            if let item = detailViewModel.cellForItemAt() {
                cell.setCell(item)
            }
            return cell
        }else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailPreviewCell.identifier, for: indexPath) as! DetailPreviewCell
            if let item = detailViewModel.cellForItemAt() {
                cell.horizontolController.collectionView.reloadCollectionViewOnMainThread()
                cell.horizontolController.app = item
            }
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identifier, for: indexPath) as! ReviewCell
            cell.reviewHorizontolController.entryList = detailViewModel.createEntryCell()
            cell.reviewHorizontolController.collectionView.reloadCollectionViewOnMainThread()
            
            return cell
            
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func setId(_ id: String?) {
        detailViewModel.appId = id
    }
    func registerCollectionCell() {
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        collectionView.register(DetailPreviewCell.self, forCellWithReuseIdentifier: DetailPreviewCell.identifier)
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.identifier)
    }
}

//MARK: - Extension
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
        if indexPath.item == 0 {
            //Calculate the necessary size for our cell
            let dummyCell = DetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            //immediately force update view
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            return .init(width: view.frame.width, height: estimatedSize.height)
        } else  if indexPath.item == 1{
            return .init(width: view.frame.width, height: 500)
        }else {
            return .init(width: view.frame.width, height: 300)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}
