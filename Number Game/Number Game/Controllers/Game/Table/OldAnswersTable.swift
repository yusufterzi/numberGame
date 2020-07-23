//
//  OldAnswersTable.swift
//  Number Game
//
//  Created by yusuf terzi on 23.07.2020.
//  Copyright © 2020 yusufTerzi. All rights reserved.
//

import UIKit

class OldAnswersTable: UITableView {
    
    var viewModel: OldAnswersTableModel?
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }

    func setModel(model: OldAnswersTableModel) {
        viewModel = model
        viewModel?.answersArrayChanged = { [weak self] in
            self?.reloadData()
        }
    }
}

extension OldAnswersTable: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.answersArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = AnswerCell.loadFromNib()
        if let data = viewModel?.answersArray[indexPath.row] {
            data.order = indexPath.row
            cell.setData(data: data)
        }
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
 
}
