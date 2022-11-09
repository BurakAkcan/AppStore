//
//  AppsCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

class AppsCell: UICollectionViewCell {
    
    static let identifier = String(describing: AppsCell.self)
    
    let titleLabel: UILabel = UILabel(text: "AppSection", font: .systemFont(ofSize: 28, weight: .semibold))
    
    let horizontolCollection = AppsHorizontolCollection()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        
        addSubview(titleLabel)
        addSubview(horizontolCollection.view)
        horizontolCollection.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        
    }
    
    func setCell(_ feed: FeedResponse? ) {
        guard let feed = feed else {
            return
        }
        titleLabel.text = feed.title
        horizontolCollection.feedGroup = feed
    }
    
}
