//
//  TodayItem.swift
//  AppStore
//
//  Created by Burak AKCAN on 8.11.2022.
//

import UIKit

struct TodayItem {
    
    let category: String
    let title: String
    let description: String
    let image: UIImage
    let bacgroundColor: UIColor
    let cellType: CellType
     
    enum CellType: String {
        case single, multiple
    }
    
}
