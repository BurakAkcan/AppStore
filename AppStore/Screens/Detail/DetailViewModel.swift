//
//  DetailViewModel.swift
//  AppStore
//
//  Created by Burak AKCAN on 27.10.2022.
//

import Foundation

protocol DetailViewModelInterface {
    var delegate: DetailVCInterface? { get set }
    func viewDidLoad()
}

class DetailViewModel: DetailViewModelInterface {
    
    var appId: String?
    
    private var app: Itune?
    private var entry: [Entry] = []
    
    weak var delegate: DetailVCInterface?
    
    func viewDidLoad() {
        delegate?.configureVC()
        fetcDetailData()
        getReview()
    }
    
    func cellForItemAt() -> Itune? {
        guard let app = app else {
            return nil
        }
        return app
    }
    
    func createEntryCell()-> [Entry] {
        entry
    }
    
    func fetcDetailData() {
        guard let appId = appId else {
            return
        }
        NetworkManager.request(endpoint: ITunesAPI.look(id: appId)) {  [weak self] (result: Result<ItunesResponse, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.app = response.results.first
                self.delegate?.reloadCollectionView()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func getReview() {
        guard let appId = appId else {
            return
        }
        
        NetworkManager.request(endpoint: ReviewAPI.review(id: appId)) {  [weak self] (result: Result<Review, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.entry = response.feed.entry
                self.delegate?.reloadCollectionView()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }

    }
    
}
