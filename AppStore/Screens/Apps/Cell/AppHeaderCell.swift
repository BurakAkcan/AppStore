//
//  AppHeaderCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 24.10.2022.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    
    static let identifier = String(describing: AppHeaderCell.self)
    
    private let companyLabel = UILabel(text: "Facebook", font: .systemFont(ofSize: 12, weight: .medium))
    private let contentLabel = UILabel(text: "Content about app..", font: .systemFont(ofSize: 24, weight: .semibold))
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.layer.cornerRadius = 12
         imageView.clipsToBounds = true
         return imageView
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        
        contentLabel.textColor = .white
        companyLabel.textColor = .white
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


private extension AppHeaderCell {
    func configureCell() {
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel,headerImageView])
        addSubview(stackView)
        stackView.spacing = 8
        stackView.distribution = .fill
        
        stackView.fillSuperview()
    }
}
