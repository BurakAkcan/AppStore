//
//  BaseCollectionViewCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 10.11.2022.
//

import UIKit

class BaseTodayCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut,animations:  {
                    self.transform = .init(scaleX: 0.9, y: 0.9)
                })
                
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.transform = .identity
                })
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureShadowCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureShadowCells() {
        layer.shadowOffset = .init(width: 2, height: 10)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        // When use the animations you can use shouldRasterize
        // layer.shouldRasterize = true
    }
    
}
