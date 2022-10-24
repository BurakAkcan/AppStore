//
//  VerticalStackView.swift
//  AppStore
//
//  Created by Burak AKCAN on 21.10.2022.
//

import UIKit

class VerticalStackView: UIStackView {
   
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
        arrangedSubviews.forEach({
            addArrangedSubview($0)
        })
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
