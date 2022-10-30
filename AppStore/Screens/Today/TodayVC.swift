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
    
    //MARK: - View Life Cycle
    
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
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.layer.cornerRadius = 16
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        // This convert method show you cgpoint that element
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return}
        redView.frame = startingFrame
        self.startingFrame = startingFrame
        
        //animate
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            redView.frame = self.view.frame
        }, completion: nil)
        
    }
    
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: .curveEaseOut) {
            gesture.view?.frame = self.startingFrame ?? .zero
        } completion: { _ in
            gesture.view?.removeFromSuperview()
        }

    }
}

extension TodayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width - (.dWidth * 0.16), height: (.dheight * 0.52))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        (.dheight * 0.04)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
