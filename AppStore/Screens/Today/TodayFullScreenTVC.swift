//
//  TodayFullScreenTVC.swift
//  AppStore
//
//  Created by Burak AKCAN on 31.10.2022.
//

import UIKit

class TodayFullScreenTVC: UITableViewController {
   
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
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        (.dheight * 0.4)
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
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayTableCell.identifier, for: indexPath) as? TodayTableCell else {         return UITableViewCell()
        }
        
        return cell
    }
}
