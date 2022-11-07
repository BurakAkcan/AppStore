//
//  HomeVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

protocol HomeVCInterface: AnyObject {
    func configureVC()
    func registerCell()
}

class TodayVC: BaseCollectionViewController {
    
    //MARK: - Properties
    
    private let viewModel = HomeViewModel()
    var startingFrame: CGRect?
    var todayTableVC: TodayFullScreenTVC?
    
    var topConstraints : NSLayoutConstraint?
    var leadingConstraints : NSLayoutConstraint?
    var widthConsraints : NSLayoutConstraint?
    var heightConsraints : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
}

//MARK: - Extensions

extension TodayVC: HomeVCInterface {
    func configureVC() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.backgroundColor = #colorLiteral(red: 0.8765783906, green: 0.8876134753, blue: 0.8874192834, alpha: 1)
    }
    
    func registerCell() {
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.identifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.identifier, for: indexPath) as? TodayCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fullscreenTVC = TodayFullScreenTVC()
        
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
            
            self.tabBarController?.tabBar.isHidden = true
        }, completion: nil)
        
    }
    
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
           // gesture.view?.frame = self.startingFrame ?? .zero
            
            self.todayTableVC?.tableView.contentOffset = .zero
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraints?.constant = startingFrame.origin.y
            self.leadingConstraints?.constant = startingFrame.origin.x
            self.widthConsraints?.constant = startingFrame.width
            self.heightConsraints?.constant = startingFrame.height
            
            self.tabBarController?.tabBar.isHidden = false
            
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            gesture.view?.removeFromSuperview()
            self.todayTableVC?.removeFromParent()
            
        }

    }
}

extension TodayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width - (.dWidth * 0.16), height: (.dheight * 0.4))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        (.dheight * 0.04)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
