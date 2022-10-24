//
//  AppsViewModel.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import Foundation

protocol AppsViewModelInterface {
    var delegate: AppsVCInterface? { get set }
    func load()
}

final class AppsViewModel: AppsViewModelInterface {
   
    private(set) var title = "Apps"
    weak var delegate: AppsVCInterface?
}

extension AppsViewModel {
    func load() {
        delegate?.configureVC()
    }
}
