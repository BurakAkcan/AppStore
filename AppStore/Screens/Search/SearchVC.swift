//
//  SearchVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

protocol SearchVCInterface: AnyObject {
    func configureVC()
    func reloadCollectionView()
}

class SearchVC: BaseCollectionViewController {
    
    //MARK: - Properties
    private let searchViewModel = SearchViewModel()
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)

    //MARK: - Views
    
    private let enterSearchLabel: UILabel = {
       let label = UILabel()
        label.text = "Please enter search term above..."
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .systemGray2
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchViewModel.delegate = self
        searchViewModel.load()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.identifier, for: indexPath) as! SearchResultCell
        let item = searchViewModel.appResults[indexPath.item]
        
        cell.setUp(item)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchLabel.isHidden = searchViewModel.appResults.count != 0
        return searchViewModel.appResults.count
    }
    deinit {
        print("deinit")
    }
    
    
    func setUpSearchBar() {
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.delegate = self
    }
    
}

// MARK: - Extensions

extension SearchVC: SearchVCInterface {
    func configureVC() {
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.identifier)
        view.addSubview(enterSearchLabel)
        enterSearchLabel.fillSuperview()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = searchViewModel.title
        setUpSearchBar()
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.term(searchText)
    }
}

extension SearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: .dWidth, height: (.dWidth / 1.2))
    }
}
