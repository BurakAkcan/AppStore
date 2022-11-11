//
//  ReviewHorizontolCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 28.10.2022.
//

import UIKit

class ReviewHorizontolCell: UICollectionViewCell {
    
    static let identifier = String(describing: ReviewHorizontolCell.self)
    
    private let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    private let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    private let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    private let bodyLabel = UILabel(text: "Review body\n review body\n", font: .systemFont(ofSize: 16), numberOflines: 5)
    private var starCount:Int = 0
    
    private let starStackView: UIStackView = {
        
        var arrangedSubViews = [UIView]()
        (0..<5).forEach { _ in
            let imageView = UIImageView(image: UIImage(named: "star.png"))
            imageView.constrainWidth(constant: 16)
            imageView.constrainHeight(constant: 16)
            arrangedSubViews.append(imageView)
        }
        arrangedSubViews.append(UIView())
        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray4
        layer.cornerRadius = 16
        clipsToBounds = true
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(_ itemEntry: Entry) {
        titleLabel.text = itemEntry.title.label
        authorLabel.text = itemEntry.author.name.label
        bodyLabel.text = itemEntry.content.label
        //we reach stackview view elements and index thanks to enumarated method, after that if index greater than rating view element alpha is zero
        for (index, view) in starStackView.arrangedSubviews.enumerated() {
            if let ratingInt = Int(itemEntry.rating.label) {
                view.alpha = index >= ratingInt ? 0 : 1
            }
        }
    }
    
    private func configureCell() {
        authorLabel.textColor = .black.withAlphaComponent(0.5)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        authorLabel.textAlignment = .right
        let horizontolStackView = HorizontolStackView(arrangedSubViews: [titleLabel, authorLabel], spacing: 8)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            horizontolStackView,starStackView, bodyLabel
        ], spacing: 12)
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 16, bottom: 0, right: 16))
    }
}
