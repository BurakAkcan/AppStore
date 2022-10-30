//
//  ReviewCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 28.10.2022.
//

import Foundation
import UIKit

class ReviewCell: UICollectionViewCell {
    static let identifier = String(describing: ReviewCell.self)
    
    let reviewHorizontolController = ReviewHorizontolController()
    let titleLabel = UILabel(text: "Review & Ratings", font: .boldSystemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        addSubview(titleLabel)
        addSubview(reviewHorizontolController.view)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 20, bottom: 0
                                                                                                                          , right: 12))
        reviewHorizontolController.view.anchor(top: titleLabel.bottomAnchor , leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        
    }
    
    
}
