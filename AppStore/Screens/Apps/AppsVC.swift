//
//  AppsVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

fileprivate let dumyId = "header"

protocol AppsVCInterface: AnyObject {
    func configureVC()
   func reloadCollectionView()
}

class AppsVC: BaseCollectionViewController {
    
    //MARK: -Properties
    
    private let appsViewModel = AppsViewModel()
    
    //MARK: - Outputs
    
    
    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        appsViewModel.delegate = self
        appsViewModel.load()

    }
    
    deinit {
        print("DEİNİTLİZE OLdu Burası jlafldnfsdnfhsdklfjsdlkjf")
    }
    //1
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsHeader.identifier, for: indexPath)
        return header
    }
    //2
    private func configureCollectionRegister() {
        collectionView.register(AppsCell.self, forCellWithReuseIdentifier: AppsCell.identifier)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsHeader.identifier)

    }
    //3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: .dWidth, height: .dheight * 0.35)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         //appsViewModel.numberOfItemInSection()
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.identifier, for: indexPath) as? AppsCell else {
            return UICollectionViewCell()
        }
        if  let feed = appsViewModel.setAppGroup(){
            cell.setCell(feed)
           
        }
        
        
        return cell
    }
}

//MARK: - Extensions

extension AppsVC: AppsVCInterface {
    func configureVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = appsViewModel.title
        configureCollectionRegister()
        
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension AppsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: .dWidth - 12, height: .dWidth * 0.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}


