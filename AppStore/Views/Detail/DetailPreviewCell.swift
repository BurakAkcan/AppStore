//
//  DetailPreviewCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 28.10.2022.
//

import UIKit

class DetailPreviewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DetailPreviewCell.self)
    
    let horizontolController = PreviewScreenController()
    let previewLabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        addSubview(previewLabel)
        addSubview(horizontolController.view)
        previewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 20, bottom: 0
                                                                                                                          , right: 12))
        horizontolController.view.anchor(top: previewLabel.bottomAnchor , leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 8, left: 0, bottom: 0, right: 0))
    }
}
