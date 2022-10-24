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
    
    private var appList: [AppResult] = []
     var appGroup: FeedResponse?
    
    weak var delegate: AppsVCInterface?
}

extension AppsViewModel {
    func load() {
        delegate?.configureVC()
        fetchData() // Buradan kaldırılacak
    }
    
    func numberOfItemInSection()->Int {
        appList.count
    }
    
    func forItemAt(indexPath: IndexPath)-> AppResult {
        let item = appList[indexPath.item]
        return item
    }
    
    func setAppGroup() -> FeedResponse?{
        return appGroup

    }
    
    func fetchData() {
        NetworkManager.request(endpoint: AppsAPI.apps) { [weak self] (result: Result<AppResponse, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.appList = data.feed.results
                self.appGroup = data.feed
                self.delegate?.reloadCollectionView()
            case .failure(let error):
                print("HATA VAR \(error.localizedDescription)")
            }
        }
    }
}
