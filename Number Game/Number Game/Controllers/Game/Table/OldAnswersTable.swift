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

}

extension OldAnswersTable: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.answersArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
 
}
