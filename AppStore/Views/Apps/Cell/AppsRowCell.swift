//
//  AppsRowCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit
import SDWebImage

class AppsRowCell: UICollectionViewCell {
    
   static let identifier = String(describing: AppsRowCell.self )
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.backgroundColor = .blue
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureCell()
    } 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setCell(_ item: AppResult) {
        nameLabel.text = item.name
        companyLabel.text = item.artistName
        iconImageView.sd_setImage(with: URL(string: item.artworkUrl100))
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
    }
}
