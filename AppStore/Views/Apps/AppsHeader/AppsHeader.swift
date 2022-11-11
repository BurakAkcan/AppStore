//
//  AppsHeader.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

class AppsHeader: UICollectionReusableView {
    
    static let identifier = String(describing: AppsHeader.self)
    
    let appsHeaderHoriziontolController = AppsHeaderHoriziontolController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(appsHeaderHoriziontolController.view)
        appsHeaderHoriziontolController.view.fillSuperview()
        
    }
}
