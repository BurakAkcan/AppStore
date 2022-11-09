//
//  MultipleAppCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 8.11.2022.
//

import UIKit
import SDWebImage


class MultipleAppCell: UICollectionViewCell {
    
    static let idetifier = String(describing: MultipleAppCell.self)
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.widthAnchor.constraint(equalToConstant: .dWidth*0.15).isActive = true
         imageView.heightAnchor.constraint(equalToConstant: .dWidth*0.15).isActive = true
         imageView.layer.cornerRadius = 12
         imageView.clipsToBounds = true
         return imageView
     }()
    
    private let nameLabel: UILabel = UILabel(text: "App name", font: .systemFont(ofSize: 16, weight: .medium))
    private let companyLabel: UILabel = UILabel(text: "company name", font: .systemFont(ofSize: 8, weight: .light))
    private let  getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: .dWidth*0.2).isActive = true
        return button
    }()
    
    private let seperatorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.4)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        let labelStackView = VerticalStackView(arrangedSubviews: [nameLabel,companyLabel])
        labelStackView.spacing = 6
        let viewComponents:[UIView] = [iconImageView,labelStackView,getButton]
        let stackView = HorizontolStackView(arrangedSubViews: viewComponents, spacing: 0)
        stackView.spacing = 16
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 2, left: 4, bottom: 2, right: 4))
        addSubview(seperatorView)
        seperatorView.anchor(top: nil, leading: nameLabel.leadingAnchor, bottom: self.bottomAnchor, trailing: getButton.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 2, right: 0), size: .init(width: 0, height: 0.5))
    }
    
    public func setCell(_ item: AppResult) {
        nameLabel.text = item.name
        companyLabel.text = item.artistName
        iconImageView.sd_setImage(with: URL(string: item.artworkUrl100))
    }
    
}
