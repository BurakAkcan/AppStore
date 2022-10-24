//
//  HomeViewModel.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import Foundation

protocol HomeViewModelInterface {
    
    var delegate: HomeVCInterface? { get set }
    func load()
    
}

final class HomeViewModel: HomeViewModelInterface {
    
    
   private(set) var title: String = "Today"
    weak var delegate: HomeVCInterface?
}
extension HomeViewModel {
    func load() {
        delegate?.configureVC()
        
    }
   
    
    
}
