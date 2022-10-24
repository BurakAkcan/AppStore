//
//  UILabel+Extension.swift
//  AppStore
//
//  Created by Burak AKCAN on 23.10.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}
