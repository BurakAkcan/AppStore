//
//  TodayCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 30.10.2022.
//

import UIKit

class TodayCell: BaseTodayCell {
    
    static let identifier = String(describing: TodayCell.self)
    
    private let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 16))
    private let titleLabel = UILabel(text: "Utilizing Your Time", font: .boldSystemFont(ofSize: 20))
    private let descriptionLabel = UILabel(text: "All the text.. All the text.. All the text.. All the text.. All the text.. All the text..", font: .systemFont(ofSize: 14), numberOflines: 3)
    
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
        imageView.clipsToBounds = true
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
        let sv = VerticalStackView(arrangedSubviews: [categoryLabel ,titleLabel, imageContainerView  ,descriptionLabel], spacing:  6)
        addSubview(sv)
        sv.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 30, left: 25, bottom: 25, right: 25))
    }
    
    func setCell(item: TodayItem) {
        categoryLabel.text = item.category
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        imageView.image = item.image
        self.backgroundColor = item.bacgroundColor
    }
}
