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
    
    private var appGroupList: [AppResponse] = []
    private var appGroup1: AppResponse?
    private var appGroup2: AppResponse?
    
    private var socialAppList: Socials = []
    
    weak var delegate: AppsVCInterface?
}

extension AppsViewModel {
    func load() {
        delegate?.configureVC()
        fetchData() // Buradan kaldırılacak
    }
    
    func numberOfItemInSection()->Int {
        appGroupList.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> FeedResponse? {
        appGroupList[indexPath.item].feed
    }
    
    func setHeader()-> Socials {
        return socialAppList
    }
    
    func fetchData() {
        delegate?.startActivity()
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        NetworkManager.request(endpoint: SocialAPI.social) { [weak self] (result: Result<Socials, Error>) in
            dispatchGroup.leave()
            guard let self = self else { return }
            switch result {
            case .success(let socailList):
                self.socialAppList = socailList
                print(socailList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        dispatchGroup.enter()
        NetworkManager.request(endpoint: AppsAPI.free) { [weak self] (result: Result<AppResponse, Error>) in
            dispatchGroup.leave()
            guard let self = self else { return }
            switch result {
            case .success(let freeGroup):
                self.appGroup1 = freeGroup
                print("ÜCRETSİZ app")
            case .failure(let error):
                print("HATA VAR \(error.localizedDescription)")
            }
        }
        
        dispatchGroup.enter()
        NetworkManager.request(endpoint: AppsAPI.paid) { [weak self] (result: Result<AppResponse, Error>) in
            dispatchGroup.leave()
            guard let self = self else { return }
            switch result {
            case .success(let paidGroup):
                self.appGroup2 = paidGroup
                print("ÜCRETLİ app")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.delegate?.stopActivity()
            
            if let group = self.appGroup1 {
                self.appGroupList.append(group)
            }
            if let group = self.appGroup2 {
                self.appGroupList.append(group)
            }
            self.delegate?.reloadCollectionView()
        }
    }
}
