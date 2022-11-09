//
//  HomeViewModel.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import Foundation

protocol TodayViewModelInterface {
    
    var itemList: [TodayItem] { get set }
    var appList: [AppResult] { get set }
    var delegate: TodayVCInterface? { get set }
    func load()
    func numberOfItemsInSection() ->Int
    func cellForItemAt(indexPath: IndexPath) -> TodayItem
    func fetchData()
}

final class TodayViewModel: TodayViewModelInterface {
    
    var itemList: [TodayItem] = []
    
    var appList: [AppResult] = []
    
    private(set) var title: String = "Today"
    weak var delegate: TodayVCInterface?
    
    func numberOfItemsInSection() -> Int {
        itemList.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> TodayItem {
        itemList[indexPath.item]
    }
    
    func fetchData() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        NetworkManager.request(endpoint: AppsAPI.paid) { [weak self] (result: Result<AppResponse, Error>) in
            
            dispatchGroup.leave()
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let paidGroup):
                
                self.appList = paidGroup.feed.results
                print(self.appList.count)
                
                print("ÜCRETLİ app")
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
        dispatchGroup.notify(queue: .main) {
            self.itemList = [TodayItem(category: "LIFE HACK", title: "Utilizing your life", description: "All the tools and apps you need to intelligently organize your life the right way", image: #imageLiteral(resourceName: "garden"), bacgroundColor: .white, cellType: .single), TodayItem(category: "THE DAILY LIST", title: "Test-Drive These CarPlay Apps ", description: "", image: #imageLiteral(resourceName: "garden"), bacgroundColor: .white, cellType: .multiple) , TodayItem(category: "Holidays", title: "Travel on a budget", description: "Find out all need to know on to travel without packing everything ", image: #imageLiteral(resourceName: "holiday.png"), bacgroundColor: #colorLiteral(red: 0.9782289863, green: 0.9682914615, blue: 0.7223435044, alpha: 1), cellType: .single)]
            self.delegate?.reloadCollection()
            self.delegate?.stopActivity()
        }
        
    }
}
extension TodayViewModel {
    func load() {
        delegate?.startActivity()
        delegate?.configureVC()
        delegate?.registerCell()
        fetchData()
    }
}
