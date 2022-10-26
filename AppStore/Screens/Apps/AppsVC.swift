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
    func startActivity()
    func stopActivity()
}

class AppsVC: BaseCollectionViewController {
    
    //MARK: -Properties
    
    private let appsViewModel = AppsViewModel()
    
    //MARK: - Outputs
    let activityIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .black
        return aiv
    }()
    
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
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsHeader.identifier, for: indexPath) as? AppsHeader else { return UICollectionReusableView() }
        header.appsHeaderHoriziontolController.socialList = appsViewModel.setHeader()
        header.appsHeaderHoriziontolController.collectionView.reloadCollectionViewOnMainThread()
        return header
    }
    //2
    private func configureCollectionRegister() {
        collectionView.register(AppsCell.self, forCellWithReuseIdentifier: AppsCell.identifier)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsHeader.identifier)
        
    }
    //3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: .dWidth, height: .dheight * 0.35)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appsViewModel.numberOfItemInSection()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.identifier, for: indexPath) as? AppsCell else {
            return UICollectionViewCell()
        }
        
        if let feed = appsViewModel.cellForItemAt(indexPath: indexPath){
            cell.setCell(feed)
            return cell
        }
        return UICollectionViewCell()
    }
}

//MARK: - Extensions

extension AppsVC: AppsVCInterface {
    func configureVC() {
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        startActivity()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = appsViewModel.title
        configureCollectionRegister()
        
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func startActivity() {
        activityIndicator.startAnimating()
    }
    func stopActivity() {
        activityIndicator.stopAnimating()
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
