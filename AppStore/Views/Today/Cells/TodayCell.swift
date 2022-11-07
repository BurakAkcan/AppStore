//
//  TodayCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 30.10.2022.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    static let identifier = String(describing: TodayCell.self)
    
    private let imageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "garden.png"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }
    
    
}
