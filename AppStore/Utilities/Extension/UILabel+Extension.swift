//
//  UILabel+Extension.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOflines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = numberOflines
    }
}
