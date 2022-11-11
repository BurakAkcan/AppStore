//
//  TodayFullScreenTVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 31.10.2022.
//

import UIKit

class TodayFullScreenTVC: UITableViewController {
    var todayItem: TodayItem?{
        didSet {
            self.view.backgroundColor = todayItem?.bacgroundColor
        }
    }
}

//MARK: - Extensions

extension TodayFullScreenTVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        configureTableView()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TodayCell()
        if let item = todayItem {
            header.setCell(item: item)
            header.clipsToBounds = true
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        (.dheight * 0.55)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    private func registerCell() {
        tableView.register(TodayTableCell.self, forCellReuseIdentifier: TodayTableCell.identifier)
    }
    
    private func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarheight = window?.windowScene?.statusBarManager?.statusBarFrame.height
        if let height = statusBarheight {
            tableView.contentInset = .init(top: 0, left: 0, bottom: height + 20, right: 0)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayTableCell.identifier, for: indexPath) as? TodayTableCell else {         return UITableViewCell()
        }
        cell.backgroundColor = todayItem?.bacgroundColor
        return cell
    }
}
