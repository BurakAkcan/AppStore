//
//  DetailCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 27.10.2022.
//

import UIKit
import SDWebImage

class DetailCell: UICollectionViewCell {
    static let identifier = String(describing: DetailCell.self)
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel = UILabel(text: "app name ", font: .systemFont(ofSize: 20, weight: .medium), numberOflines: 2)
    
    private let  priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("4.99", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6745942235, blue: 0.8805531859, alpha: 1)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: .dWidth*0.15).isActive = true
        return button
    }()
    
    private let newsLabel: UILabel = UILabel(text: "What's News", font: .systemFont(ofSize: 20, weight: .bold))
    
    private let releaseNoteLabel: UILabel = UILabel(text: "release note label..", font: .systemFont(ofSize: 16), numberOflines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setCell(_ app: Itune) {
        nameLabel.text = app.trackName
        releaseNoteLabel.text = app.releaseNotes
        priceButton.setTitle(app.formattedPrice, for: .normal)
        if let url = URL(string: app.artworkUrl100) {
            iconImageView.sd_setImage(with: url)
        }
    }
    
    private func configureCell() {
        priceButton.widthAnchor.constraint(equalToConstant: .dWidth*0.1).isActive = true
        iconImageView.constrainHeight(constant: 100)
        iconImageView.constrainHeight(constant: 100)
        
        let spaceStack = HorizontolStackView(arrangedSubViews: [priceButton,UIView()])
        spaceStack.distribution = .fillEqually
        let vertiStackView = VerticalStackView(arrangedSubviews: [
          nameLabel,
          spaceStack,
          UIView()
        ], spacing: 6)
        
        let horiStackView = HorizontolStackView(arrangedSubViews: [
          iconImageView,
          vertiStackView
        ], spacing: 6)
        horiStackView.distribution = .fillEqually
        
        let stackView = VerticalStackView(arrangedSubviews: [
           horiStackView,
           newsLabel,
           releaseNoteLabel
        ],spacing: 4)
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
}
