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
        self.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        
        addSubview(reviewHorizontolController.view)
        reviewHorizontolController.view.fillSuperview()
        
    }
    
    
}
