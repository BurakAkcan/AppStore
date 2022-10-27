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
    
   weak var delegate: DetailVCInterface?
    
    func viewDidLoad() {
       // print(appId)
        delegate?.configureVC()
        fetcDetailData()
    }
    
    func fetcDetailData() {
        guard let appId = appId else {
            return
        }
       

        NetworkManager.request(endpoint: ITunesAPI.look(id: appId)) {  [weak self] (result: Result<ItunesResponse, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response.results[0].releaseNotes)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}
