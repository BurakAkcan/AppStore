//
//  HomeVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

protocol TodayVCInterface: AnyObject {
    func configureVC()
    func registerCell()
    func reloadCollection()
    func startActivity()
    func stopActivity()
}

class TodayVC: BaseCollectionViewController {
    
    //MARK: - Properties
    
    private let viewModel = TodayViewModel()
    var startingFrame: CGRect?
    var todayTableVC: TodayFullScreenTVC?
    
    var topConstraints : NSLayoutConstraint?
    var leadingConstraints : NSLayoutConstraint?
    var widthConsraints : NSLayoutConstraint?
    var heightConsraints : NSLayoutConstraint?
    
    //MARK: - Outputs
    
    let activityIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.setNeedsLayout()
    }
}

//MARK: - Extensions

extension TodayVC: TodayVCInterface {
    func configureVC() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.backgroundColor = #colorLiteral(red: 0.8765783906, green: 0.8876134753, blue: 0.8874192834, alpha: 1)
        view.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
    
    func startActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopActivity() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func registerCell() {
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.CellType.single.rawValue)
        collectionView.register(TodayMultipleCell.self, forCellWithReuseIdentifier: TodayItem.CellType.multiple.rawValue)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // you can do that give an identifier cell
        let cellId = viewModel.itemList[indexPath.item].cellType.rawValue
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? TodayCell {
            cell.setCell(item: viewModel.cellForItemAt(indexPath: indexPath))
        }else if let cell = cell as? TodayMultipleCell {
            cell.multipleAppsController.appList = viewModel.appList
            cell.multipleAppsController.didSelectHandler = { [weak self] app in
                guard let self = self else { return }
                let detailController = DetailVC()
                detailController.setId(app.id)
                self.navigationController?.pushViewController(detailController, animated: true)
            }
            cell.setCell(item: viewModel.cellForItemAt(indexPath: indexPath))
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if viewModel.itemList[indexPath.item].cellType == .single {
            let fullscreenTVC = TodayFullScreenTVC()
            fullscreenTVC.todayItem = viewModel.cellForItemAt(indexPath: indexPath)
            let todayTableView = fullscreenTVC.view!
            view.addSubview(todayTableView)
            addChild(fullscreenTVC)
            self.todayTableVC = fullscreenTVC
            todayTableView.layer.cornerRadius = 16
            todayTableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
            guard let cell = collectionView.cellForItem(at: indexPath) else { return }
            // This convert method show you cgrect that element
            guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return}
            // todayTableView.frame = startingFrame
            self.startingFrame = startingFrame
            
            todayTableView.translatesAutoresizingMaskIntoConstraints = false
            self.topConstraints = todayTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
            self.leadingConstraints = todayTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
            self.widthConsraints = todayTableView.widthAnchor.constraint(equalToConstant: startingFrame.width)
            self.heightConsraints = todayTableView.heightAnchor.constraint(equalToConstant: startingFrame.height)
            
            [topConstraints, leadingConstraints, widthConsraints, heightConsraints].forEach({$0?.isActive = true})
            self.view.layoutIfNeeded()
            
            //animate
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
                // todayTableView.frame = self.view.frame
                
                self.topConstraints?.constant = 0
                self.leadingConstraints?.constant = 0
                self.widthConsraints?.constant = self.view.frame.width
                self.heightConsraints?.constant = self.view.frame.height
                self.view.layoutIfNeeded()
                self.navigationController?.navigationItem.largeTitleDisplayMode = .never
                self.navigationController?.isNavigationBarHidden = true
                self.tabBarController?.tabBar.isHidden = true
            }, completion: nil)
        }
    }
    
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            self.todayTableVC?.tableView.contentOffset = .zero
            guard let startingFrame = self.startingFrame else { return }
            self.topConstraints?.constant = startingFrame.origin.y
            self.leadingConstraints?.constant = startingFrame.origin.x
            self.widthConsraints?.constant = startingFrame.width
            self.heightConsraints?.constant = startingFrame.height
            self.tabBarController?.tabBar.isHidden = false
            self.navigationController?.isNavigationBarHidden = false
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            gesture.view?.removeFromSuperview()
            self.todayTableVC?.removeFromParent()
        }
    }
    func reloadCollection() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


extension TodayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width - (.dWidth * 0.16), height: (.dheight * 0.55))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        (.dheight * 0.04)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
