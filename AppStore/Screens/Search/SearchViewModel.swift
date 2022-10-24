//
//  SearchViewModel.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import Foundation
import SDWebImage

protocol SearchViewModelInterface {
    var delegate: SearchVCInterface? { get set }
    func load()
}

final class SearchViewModel: SearchViewModelInterface {
    
    private(set) var appResults: [Itune] = []
    weak var delegate: SearchVCInterface?
    private(set) var title = "Search"
    private var timer: Timer?
    
    var term:String?
    
    func load() {
        delegate?.configureVC()
    }
    
    func term(_ term: String) {
        self.term = term
        getApps()
    }
    
    
    func getApps() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            NetworkManager.request(endpoint: ITunesAPI.iTune(term: self.term ?? "")) { [weak self] (result: Result<ItunesResponse, Error>) in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    self.appResults = data.results
                    self.delegate?.reloadCollectionView()
                    
                case .failure(let error):
                    self.appResults = []
                    
                    print("HATA VAR \(error.localizedDescription)")
                }
            }
        }
    }
}