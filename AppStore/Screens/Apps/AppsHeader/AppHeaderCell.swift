//
//  AppHeaderCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 24.10.2022.
//

import UIKit
import SDWebImage

class AppHeaderCell: UICollectionViewCell {
    
    static let identifier = String(describing: AppHeaderCell.self)
    
    private let companyLabel = UILabel(text: "Facebook", font: .systemFont(ofSize: 12, weight: .light))
    private let contentLabel = UILabel(text: "Content about app..", font: .systemFont(ofSize: 24, weight: .medium))
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(_ item: Social?) {
        guard let item = item else {
            return
        }
        companyLabel.text = item.name
        contentLabel.text = item.tagline
        headerImageView.sd_setImage(with: URL(string: item.imageUrl))
    }
}

private extension AppHeaderCell {
    func configureCell() {
        let imagePadding: CGFloat = 18
        companyLabel.textColor = .systemBlue
        contentLabel.numberOfLines = 2
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel, contentLabel ,headerImageView],spacing: 6)
        NSLayoutConstraint.activate([
            headerImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: imagePadding),
            headerImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -imagePadding)
        ])
        addSubview(stackView)
        stackView.distribution = .fill
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
}
