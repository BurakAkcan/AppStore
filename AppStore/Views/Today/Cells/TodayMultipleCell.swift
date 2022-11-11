//
//  TodayMultipleCell.swift
//  AppStore
//
//  Created by Burak AKCAN on 8.11.2022.
//

import UIKit

class TodayMultipleCell: BaseTodayCell {
    
    static let identifier = String(describing: TodayMultipleCell.self)
    
    private let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 16))
    private let titleLabel = UILabel(text: "Utilizing Your Time", font: .boldSystemFont(ofSize: 26), numberOflines: 2)
    
    let multipleAppsController = TodayMultipleController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        self.backgroundColor = .white
        // self.clipsToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        configureCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private
    func configureCell() {
        let sv = VerticalStackView(arrangedSubviews: [categoryLabel, titleLabel, multipleAppsController.view], spacing: 8)
        addSubview(sv)
        sv.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    func setCell(item: TodayItem) {
        categoryLabel.text = item.category
        titleLabel.text = item.title
    }
    
}
