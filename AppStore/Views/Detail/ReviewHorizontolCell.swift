//
//  ReviewHorizontolCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 28.10.2022.
//

import UIKit

class ReviewHorizontolCell: UICollectionViewCell {
    
    static let identifier = String(describing: ReviewHorizontolCell.self)
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    let bodyLabel = UILabel(text: "Review body\n review body\n", font: .systemFont(ofSize: 16), numberOflines: 0)
    
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
    }
    
    private func configureCell() {
        authorLabel.textColor = .black.withAlphaComponent(0.5)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        authorLabel.textAlignment = .right
        let horizontolStackView = HorizontolStackView(arrangedSubViews: [titleLabel, authorLabel], spacing: 8)
        
       let stackView = VerticalStackView(arrangedSubviews: [
          horizontolStackView,starsLabel, bodyLabel
        ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 18, left: 18, bottom: 18, right: 18))
    }
    
    
}
