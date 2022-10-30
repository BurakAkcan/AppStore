//
//  SearchVCCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 20.10.2022.
//

import UIKit

final class SearchResultCell: UICollectionViewCell {
    
    static let identifier = "SearchResultCell"

    private let  iconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.widthAnchor.constraint(equalToConstant: .dWidth*0.15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: .dWidth*0.15).isActive = true
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let   nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Test label"
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    private let   categoryLabel: UILabel = {
       let label = UILabel()
        label.text = "Category"
        return label
    }()
    
    private let   ratingsLabel: UILabel = {
       let label = UILabel()
        label.text = "9.2 M "
        return label
    }()
    
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
    
   private lazy var screenShotImage1 = createScreenShotImageView()
   private  lazy var screenShotImage2 = createScreenShotImageView()
   private lazy var screenShotImage3 = createScreenShotImageView()
   private lazy var screenList = [screenShotImage1,screenShotImage2,screenShotImage3]
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.clear
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.7).cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }
    
         
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(_ item:  Itune) {
        nameLabel.text = item.trackName
        categoryLabel.text = item.primaryGenreName
        ratingsLabel.text = String(format: "%.2f", item.averageUserRating ?? "")
       // iconImageView.loadFromURL(urlString: item.artworkUrl100)
      //  screenShotImage1.loadFromURL(urlString: item.screenshotUrls[0])
        let url = URL(string: item.artworkUrl100)!
        iconImageView.sd_setImage(with: url)
        
        
        if item.screenshotUrls.count >= 3 {
            screenShotImage1.sd_setImage(with: URL(string: item.screenshotUrls[0]))
            screenShotImage2.sd_setImage(with: URL(string: item.screenshotUrls[1]))
            screenShotImage3.sd_setImage(with: URL(string: item.screenshotUrls[2]))
        }else if item.screenshotUrls.count >= 2 {
            screenShotImage1.sd_setImage(with: URL(string: item.screenshotUrls[0]))
            screenShotImage2.sd_setImage(with: URL(string: item.screenshotUrls[1]))
            screenShotImage3.sd_setImage(with: URL(string: item.screenshotUrls[1]))
        } else if item.screenshotUrls.count >= 1 {
            screenShotImage1.sd_setImage(with: URL(string: item.screenshotUrls[0]))
            screenShotImage2.sd_setImage(with: URL(string: item.screenshotUrls[0]))
            screenShotImage3.sd_setImage(with: URL(string: item.screenshotUrls[0]))
        }else {
            screenList.forEach { view in
                view.image = UIImage(systemName: "photo")
            }
        }
        
        
    }
    
    private func configureCell () {
       let labelsComponents: [UIView] = [nameLabel, categoryLabel , ratingsLabel]
       let labelsStackView = VerticalStackView(arrangedSubviews: labelsComponents)
        let components: [UIView] = [iconImageView,labelsStackView ,getButton]
       let infoTopStackView = HorizontolStackView(arrangedSubViews: components, spacing: 12)
        infoTopStackView.alignment = .center
        let screenShotStackView = HorizontolStackView(arrangedSubViews: [screenShotImage1,screenShotImage2,screenShotImage3], spacing: 8)
        screenShotStackView.distribution = .fillEqually
        let overalstackView = VerticalStackView(arrangedSubviews: [infoTopStackView,screenShotStackView], spacing: 12)
        contentView.addSubview(overalstackView)
        overalstackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))

    }
    
    
}
