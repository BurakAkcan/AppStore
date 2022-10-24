//
//  HomeVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

protocol HomeVCInterface: AnyObject {
    func configureVC()
    
}

class HomeVC: UIViewController {
    
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.load()
    }
    
    
}

extension HomeVC: HomeVCInterface {
    func configureVC() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}
